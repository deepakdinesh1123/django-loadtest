from locust import HttpUser,task, between

class UserBehavior(HttpUser):

    wait_time = between(5000, 9000)

    def on_start(self):
        self.test()

    @task
    def test(self):
        self.client.get("/simple/test")
