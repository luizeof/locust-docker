from locust import HttpLocust, TaskSet, task
class UserBehavior(TaskSet):
    def on_start(self):
        """ on_start is called when a Locust start before
            any task is scheduled
        """
        self.mtracking()
    def mtracking(self):
        self.client.get("/mtracking.gif")
    @task(1)
    def mtc(self):
        self.client.post("/mtc.js")
class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 5000
    max_wait = 9000
