#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.8"
# dependencies = ["click"]
# ///

from pathlib import Path
import click
import subprocess

VIDEO_EXTENSIONS = ['.mp4', '.mov', '.mkv', '.webm', '.flv', '.avi', '.wmv', '.m4v', '.3gp', '.3g2', '.mpg', '.mpeg', '.m2v', '.m4v', '.ts', '.mts', '.m2ts', '.vob', '.ogv', '.ogg', '.rm', '.rmvb', '.asf', '.wma', '.wmv', '.webm', '.flv', '.f4v', '.f4p', '.f4a', '.f4b']

def get_all_vids(path: Path):
    # Get all videos in the directory
    vids = []
    for ext in VIDEO_EXTENSIONS:
        vids.extend(path.glob(f'*{ext}'))
        vids.extend(path.glob(f'*{ext.upper()}'))

    return vids

def determine_date_of_video(path):
    # Get the date of the video
    cmd = ['ffprobe', '-v', 'error', '-show_entries', 'format_tags=creation_time', '-of', 'default=noprint_wrappers=1:nokey=1', path]
    try:
        creation_time = subprocess.check_output(cmd).decode('utf-8').strip()
    except subprocess.CalledProcessError:
        return None
    return creation_time

def stub_creation_time_to_just_date(creation_time):
    # Get just the date from the creation time
    return creation_time.split('T')[0]

def suffix_file(file, suffix):
    # Add a suffix to a file
    if suffix in file.stem:
        return file
    return file.with_name(f'{file.stem}.{suffix}{file.suffix}')

def rename_file(file, new_name):
    # Rename a file
    file.rename(new_name)


@click.command()
@click.argument('path', type=click.Path(exists=True), default='.')
@click.option('-r', '--rename', is_flag=True, help='Rename the files')
def datestampvids(path: str, rename: bool):
    vids = get_all_vids(Path(path))
    if not rename:
        click.echo(click.style('Dry run, no files will be renamed', fg='yellow'))
        click.echo(click.style('Use -r to rename the files', fg='yellow'))
    # sort the videos by filename
    vids = sorted(vids, key=lambda x: x.name)
    creation_dates = set()
    for vid in vids:
        creation_time = determine_date_of_video(vid)
        if not creation_time:
            click.echo(click.style(f'{vid.name}: No creation time found', fg='red'))
            continue
        creation_date = stub_creation_time_to_just_date(creation_time)
        if creation_date:
            creation_dates.add(creation_date)
        new_filename = suffix_file(vid, creation_date)
        if new_filename == vid:
            click.echo(click.style(f'Already has date: {vid.name}', fg='blue'))
            continue
        if rename:
            rename_file(vid, new_filename)
            click.echo(click.style(f'{vid.name} → {new_filename}', fg='green'))
        else:
            click.echo(f'{vid.name} → {new_filename}')
    if len(vids) > 1 and len(creation_dates) == 1:
        click.echo(click.style('All videos have the same creation date!', fg='yellow'))


if __name__ == '__main__':
    datestampvids()
