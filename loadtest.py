from locust import HttpUser,task, between
import time

class UserBehavior(HttpUser):

    wait_time = between(5000, 9000)
    def on_start(self):
        time.sleep(10)
        self.login()
    
    def login(self):
        response = self.client.get("/admin/")
        csrftoken = response.cookies['csrftoken']
        self.client.post(
        '/admin/',
        {
            'username': 'admin',
            'password': 'Admin@1234',
            'csrfmiddlewaretoken': csrftoken
        },
        headers={
            'X-CSRFToken': csrftoken,
            'Referer': self.host + '/admin/'
        })

    @task
    def test(self):
        self.client.get("/simple/test")
    
    @task
    def author_group(self):
        for i in range(1, 6):
            self.client.get(f"/admin/simple/authorgroup/{i}")
    
    @task
    def author_details(self):
        for i in range(1, 6):
            self.client.get(f"/admin/simple/authordetail/{i}")

    @task
    def author(self):
        for i in range(1, 6):
            self.client.get(f"/admin/simple/author/{i}")
