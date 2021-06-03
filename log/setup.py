import subprocess
import sys

def setup(ch_number, q_counts):
    base_path = '../kiwata/'
    base_path += 'ch' + ('0{}'.format(ch_number) if int(ch_number) < 10 else ch_number)

    print(base_path)

    cmd = "mkdir -p {}/question".format(base_path)
    subprocess.call(cmd, shell=True)

    message = "\(* 気になったプログラムだけ実行して行く *\)"
    cmd = 'echo {} > {}/main.ml'.format(message, base_path)
    subprocess.call(cmd, shell=True)

    message = "\(* 演習問題は基本的に全て解いていく *\)"
    cmd = 'echo {} >> {}/question/main.ml'.format(message, base_path)
    subprocess.call(cmd, shell=True)
    cmd = 'echo -n "\n" >> {}/question/main.ml'.format(base_path)
    subprocess.call(cmd, shell=True)

    for i in range(1, int(q_counts) + 1):
        message = "\(* {}.{} *\)".format(ch_number, i)
        cmd = 'echo {} >> {}/question/main.ml'.format(message, base_path)
        subprocess.call(cmd, shell=True)
        cmd = 'echo {} "\n" >> {}/question/main.ml'.format('-n' if i == int(q_counts) else '', base_path)
        subprocess.call(cmd, shell=True)


def main():
    ch_number, q_counts = sys.argv[1], sys.argv[2]
    setup(ch_number, q_counts)

if __name__ == '__main__':
    main()
