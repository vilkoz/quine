from subprocess import call
num = 5
c = """from subprocess import call
num = %d
c = %c%c%c%s%c%c%c
with open('Sully_%cd.py' %c (num - 1), 'w+') as f:
    f.write(c %c (num-1,chr(34), chr(34), chr(34), c, chr(34), chr(34), chr(34), chr(37), chr(37), chr(37), chr(37), chr(37)))

if num > 0:
    call(['python3', 'Sully_%cd.py' %c (num-1)])
"""
with open('Sully_%d.py' % (num - 1), 'w+') as f:
    f.write(c % (num-1,chr(34), chr(34), chr(34), c, chr(34), chr(34), chr(34), chr(37), chr(37), chr(37), chr(37), chr(37)))

if num > 0:
    call(['python3', 'Sully_%d.py' % (num-1)])
