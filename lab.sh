/etc/init.d/ssh restart
jupyter lab --allow-root --ip 0.0.0.0 --no-browser --NotebookApp.password="$(echo minsiou0734 | python -c 'from notebook.auth import passwd;print(passwd(input()))')"
