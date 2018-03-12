#gopa1
def f():
    pass

def main():
    c = """#gopa1
def f():
    pass

def main():
    c = %c%c%c%s%c%c%c
    print(c %c (chr(34), chr(34), chr(34), c, chr(34), chr(34), chr(34), chr(37)) , end='')

if __name__ == '__main__':
    main()
"""
    print(c % (chr(34), chr(34), chr(34), c, chr(34), chr(34), chr(34), chr(37)) , end='')

if __name__ == '__main__':
    main()
