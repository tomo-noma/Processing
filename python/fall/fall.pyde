spd_x = 1
spd_y = -1
acceleration = 1
x = 100
y = 100
radius = 100


def settings():
    fullScreen()


def setup():
    frameRate(60)
    background(0)
    
    fill(255)
    
    
def draw():
    background(0)
    global x
    global y
    global spd_x
    global spd_y
    global acceleration
    ellipse(x, y, radius, radius)
    x += spd_x
    y += spd_y
    if x > displayWidth:
        acceleration += 1
        spd_x = acceleration * -1
    elif x < 0:
        acceleration += 1
        spd_x = acceleration
        
    if y > displayHeight:
        acceleration += 1
        spd_y = acceleration * -1
    elif y < 0:
        acceleration += 1
        spd_y = acceleration
    
    
def keyPressed():
    pass
    
    
def keyReleased():
    pass
