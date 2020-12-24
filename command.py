from flask import Flask
import subprocess
from concurrent.futures import ThreadPoolExecutor

executor = ThreadPoolExecutor(2)

app = Flask(__name__)


@app.route('/run, methods=['POST']')
def run_jobs():
    s = f". run.sh {request.values['rep']} {request.values['tag']} {request.values['name']} {request.values['psw']}"
    executor.submit(command, s)
    return s


def command(s):
    subprocess.run('. run.sh ' + s, shell=True)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
