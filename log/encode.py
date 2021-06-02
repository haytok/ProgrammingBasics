import glob
import io
import os
import time
import subprocess


def encode_file(file_path):
    splited_path = file_path.split('/')
    file_name = splited_path[-1]
    update_path = '/'.join(splited_path[:-1]) + '/_{}'.format(file_name)

    cmd = "nkf -w {} > {}".format(file_path, update_path)
    subprocess.call(cmd, shell=True)

    cmd = "cp {} {}".format(update_path, file_path)
    subprocess.call(cmd, shell=True)

    cmd = "rm {}".format(update_path)
    subprocess.call(cmd, shell=True)

def main():
    file_paths = glob.glob('../source/*')
    for file_path in file_paths:
        if file_path[-3] == '.':
            print(file_path)
            encode_file(file_path)
        else:
            down_file_paths = glob.glob('{}/*'.format(file_path))
            for item in down_file_paths:
                print(item)
                encode_file(item)

if __name__ == '__main__':
    main()
