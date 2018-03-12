def MACRO1():
    pass
def MACRO2():
    pass

def EVIL_MACRO():
    # LOOK AT THIS SHIT
    c = """def MACRO1():
    pass
def MACRO2():
    pass

def EVIL_MACRO():
    # LOOK AT THIS SHIT
    c = %c%c%c%s%c%c%c
    with open('Grace_kid.py', 'w+') as f:
        f.write(c %c (chr(34), chr(34), chr(34), c, chr(34), chr(34), chr(34), chr(37)))

EVIL_MACRO()
"""
    with open('Grace_kid.py', 'w+') as f:
        f.write(c % (chr(34), chr(34), chr(34), c, chr(34), chr(34), chr(34), chr(37)))

EVIL_MACRO()
