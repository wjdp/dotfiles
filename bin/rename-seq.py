import os
import mimetypes
import shutil
import sys

def rename_files_in_directory(directory):
    # Check if the provided path is a directory
    if not os.path.isdir(directory):
        print(f"Error: '{directory}' is not a valid directory.")
        return

    # Initialize counter for renaming
    counter = 1

    # Loop through all files in the directory
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)

        # Skip directories
        if os.path.isdir(filepath):
            continue

        # Get the MIME type of the file
        mime_type, encoding = mimetypes.guess_type(filepath)

        if mime_type is None:
            raise ValueError(f"Could not determine MIME type for '{filename}'")

        # Use mimetypes to guess the file extension from the MIME type
        extension = mimetypes.guess_extension(mime_type)

        # If mimetypes couldn't guess the extension, raise an error
        if not extension:
            raise ValueError(f"Could not determine file extension for '{filename}'")

        # Create the new filename with sequential number and extension
        new_filename = f"{counter}{extension}"
        new_filepath = os.path.join(directory, new_filename)

        # Rename the file
        shutil.move(filepath, new_filepath)
        print(f"Renamed '{filename}' to '{new_filename}'")

        # Increment the counter
        counter += 1

    print("Renaming complete!")

# Main entry point
if __name__ == "__main__":
    directory_input = sys.argv[1] if len(sys.argv) > 1 else "."
    rename_files_in_directory(directory_input)
