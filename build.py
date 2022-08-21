import sys
import os
import subprocess

def build(projects):
    for project in projects:
        for dockerfile in os.listdir(f'examples\{project}\dockerfiles'):
            server = dockerfile.split(".")[0]
            subprocess.run(["docker", "build", "-t", f"{project}_{server}", "-f", f"examples\{project}\dockerfiles\{dockerfile}", "."])

if __name__=="__main__":
    projects = sys.argv[1:]
    build(projects)
