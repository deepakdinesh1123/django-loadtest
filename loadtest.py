import subprocess
import os
import sys

def get_servers(project):
    servers = []
    for dockerfile in os.listdir(f'examples\{project}\dockerfiles'):
        server = dockerfile.split(".")[0]
        servers.append(server)
    return servers

def loadtest(projects):
    for project in projects:
        locustfile = f'examples\{project}\locustfile.py'
        for server in get_servers(project):
            subprocess.run(["docker", "run", "--name", f"{server}_server" ,"-d", "-p", "8000:8000", "--rm", f"{project}_{server}"])
            subprocess.run(["locust", "-f", f"{locustfile}", "--config", "locust.conf", "--html", f"results/{project}_{server}.html"])
            subprocess.run(["docker", "stop", f"{server}_server"])

if __name__=="__main__":
    projects = sys.argv[1:]
    loadtest(projects)
