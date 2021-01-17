def setup_module():
    print('\nsetup_module: *.pyモジュールの前に実行される')


def teardown_module():
    print('\nteardown_module: *.py モジュールの後に実行される')


def setup_function():
    print('\nsetup_function: テストケースの前に実行される')


def teardown_function():
    print('\nteardown_function: テストケースの後に実行される')


def test_one():
    print("test_oneを実行中")
    x = "this"
    assert 'h' in x


def test_two():
    print("test_twoを実行中")
    x = "hello"
    assert hasattr(x, 'check')


class TestCase():

    def setup(self):
        print("\nsetup: クラスケースごとの前に実行される")

    def teardown(self):
        print("\nteardown: クラスケースごとの後に実行される")

    def setup_class(self):
        print("\nsetup_class：全てのクラスケースの前に実行される")

    def teardown_class(self):
        print("\nteardown_class：全てのクラスケースの後に実行される")

    def setup_method(self):
        print("\nsetup_method:  クラスケースごとの前に実行される")

    def teardown_method(self):
        print("\nteardown_method:  クラスケースごとの前に実行される")

    def test_three(self):
        print("test_threeを実行中")
        x = "this"
        assert 'h' in x

    def test_four(self):
        print("test_fourを実行中")
        x = "hello"
        assert hasattr(x, 'check')
