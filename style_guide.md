# Green Bums Coding Style Guide

For Godot and GDScript

## File Naming

Filenames are to be all lower-case. This is to simplify and avoid
confusion when potentially working across servers or other linux-based
systems, which use case-sensitive filesystems.

Multi-word names should have the words separated by an underscore.

Example: four_word_file_name.dat

## Folder Organization

### Parent Folder

The top level folder of a repository will normally be named in accordance
with the git repository name. Within this folder, we define the following
standard practices:

  * Subfolder "untracked" is for keeping local-only files. This folder
  is not to be tracked by the repository. Put temporary files here, or working
  files that are not meant to be saved in the repository.
    
  * Subfolder "asset_sources" is for project files used to produce the game assets.
  Example: .blend files, .aseprite files
  
  * Other folders should be Godot project folders. These folders may have
  capitalization, as the name matches the Godot Project name. The contents 
  here are managed by Godot, and it is best to *NOT* have the project
  open when doing any work in Git (Gittyup)

### Godot Folders

Within a Godot Project folder, we define the following standard subfolders:

  * addons - standard in Godot's addons system; contains addons
  * boot - contains the project's entrypoint scene, and all Autoloads
  * game - everything that doesn't go somewhere else
  * lib - reusable scripts and classes.
  * screens - the game's primary contexts (menu, settings, gameplay)
  
