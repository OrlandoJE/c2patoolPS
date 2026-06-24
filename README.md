# Automated c2patool: Powershell

> Note: To run the Powershell script, either right click the file and select `Run`, drag and drop into a Powershell terminal (the directory is going to be inputed in the terminal) and hit `enter`, or manually type the directory to run the script in Powershell.

Add all the images and videos you want to extract the manifests from in the `media` directory.

## extractCAIs.ps1

After putting the desired media in the `media` directory, simply run `extractCAIs.ps1`. It'll create a `manifest` folder in which it'll create a folder per media file to drop the extracted information.

## movejsons.ps1

Moves all the `json` files to a folder named `json` for check revisions.