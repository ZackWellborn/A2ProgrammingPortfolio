
class Box:
  #variables
  w = 0.0
  l = 0.0
  h = 0.0

  #constructor
  def __init__ (self, name):
    self.l = 0.0
    self.w = 0.0
    self.h = 0.0

# Volume Calculation
  def calcVol(self): 
    v = float(self.w)*float(self.l)*float(self.h)
    return v
    #Surface Area Calculation
  def calcSA(self):
    SA=6.0*float(self.w)*float(self.l)
    return SA