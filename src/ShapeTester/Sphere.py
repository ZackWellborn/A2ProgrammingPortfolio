import math
class Sphere:
  #variables
  r = 0.0

  #constructor
  def __init__ (self, name):
    self.r = 0.0

# Volume Calculation
  def calcVol(self): 
    v = (4.0/3.0)*math.pi*float(self.r)**3
    return v
    #Surface Area Calculation
  def calcSA(self):
    SA=4.0*math.pi*float(self.r)**2
    return SA