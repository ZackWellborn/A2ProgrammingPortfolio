import math
class Pyramid:
  w = 0.0
  l = 0.0
  h = 0.0
  def __init__ (self, name):
    self.l = 0.0
    self.w = 0.0
    self.h = 0.0
    
  def calcVol(self): 
    v = (self.w*self.l*self.h)/3
    return v
  def calcSA(self):
    SA = self.l*self.w+self.l*(math.sqrt((self.w/2)+self.h**2))+self.w*(math.sqrt(((self.l/2)**2)+self.h**2))
    #SA=self.l**3
    return SA