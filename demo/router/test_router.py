
import pytest
import allure
@allure.feature('Router config')
class TestRouter:
    @allure.story('ip config')
    def test_ip(self):
        # if(1==2):
        #     raise Exception("123")
        with allure.step("ip set "):
            print("I have send config cmd")
            if 1==1:
                print("success")
            else :
                print("false")
                assert False

    @allure.story('router port')
    def test_port(self):
        with allure.step("Start port config"):
            
            assert True
        
