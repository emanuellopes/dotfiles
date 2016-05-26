#!/usr/bin/perl -w
use strict;
use warnings;

#copy all files to dotfiles folder and update to git
#  :)

use File::Copy;
use File::Basename;
use Cwd;

my $backupFolder = $ENV{"HOME"}."/dotfiles";

#dirs for backup
my %dirs = (
$ENV{"HOME"}, 1,
$ENV{"HOME"}."/.i3", 0,
$ENV{"HOME"}."/.atom", 1,
$ENV{"HOME"}."/.scripts", 0,
$ENV{"HOME"}."/.vim", 0,
$ENV{"HOME"}."/.fonts", 0,
$ENV{"HOME"}."/.config/dunst", 0,
"/etc/acpi", 0,
"/etc/modprobe.d", 0,
"/etc/udev/rules.d/", 0,
"/etc/X11", 0
);

sub copyFolder($;$;$);
sub createFolderStructure($);
sub backupFiles();

#original folder - new folder - onlyFiles
sub copyFolder($;$;$) {
  my($old_dir,$new_dir,$onlyFiles) = @_;
  my $root_folder = $new_dir.$old_dir;
  opendir(my $DIR, $old_dir) || die "Could not open dir '$old_dir': $!\n";

  while( (my $entry = readdir($DIR))){
    next if $entry eq ".";
    next if $entry eq "..";
    next if $entry =~ /\w*.(log|lock|~)/; #remove log files
    next if($old_dir eq $ENV{"HOME"}) & ($entry =~ /^[^.]\w*/); #if home folder only add .files
    my $source = "$old_dir/$entry";
    if (-d $source) {
      next if $onlyFiles eq "1";
      my $destination = "$root_folder/$entry";
      mkdir $destination or die "mkdir '$destination' failed: $!" if not -e $destination;
      copyFolder($source, $new_dir,$onlyFiles);
    } else {
      copy($source, $root_folder) or die "copy failed: $!";
    }
  }
  closedir($DIR);
}

#create folder sructure inside backupFolder
sub createFolderStructure($) {
  my $dir = $_[0];
  return if (-d $dir);
  createFolderStructure(dirname($dir));
  mkdir $dir;
}

sub backupFiles() {
  mkdir $backupFolder unless -e $backupFolder;
  foreach my $folder (keys %dirs){
    print "Back Up Folder: $folder to: $backupFolder$folder\n";
    createFolderStructure($backupFolder.$folder);
    copyFolder($folder,$backupFolder, $dirs{$folder});
  }
}

sub uploadToGit(){
  chdir ($backupFolder);
  if(!-e "$backupFolder/.git"){
    system('git init');
    print "\n\nGIT - add remote link in terminal\n";
    return;
  }
  print "Sending modifications to git\n";
  system('git add .');
  system('git commit -m "updated dotFiles with script :)"');
  system('git push origin master');
}

backupFiles();
uploadToGit();
