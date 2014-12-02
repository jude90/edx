# 6.00.2x Problem Set 4

import numpy
import random
import pylab
from ps3b import *

#
# PROBLEM 1
#        
def simulationDelayedTreatment(numTrials):
    """
    Runs simulations and make histograms for problem 1.

    Runs numTrials simulations to show the relationship between delayed
    treatment and patient outcome using a histogram.

    Histograms of final total virus populations are displayed for delays of 300,
    150, 75, 0 timesteps (followed by an additional 150 timesteps of
    simulation).

    numTrials: number of simulation runs to execute (an integer)
    """
    # TODO
    patients =  [TreatedPatient(viruses=[ResistantVirus(maxBirthProb=0.1,
                                                        clearProb=0.05,
                                                        resistances={'guttagonol': False},
                                                        mutProb=0.005) 
                                        for x in xrange(100)],
                                maxPop=1000) for i in xrange(numTrials)]
    delay = 75
    viruspops = []
    for p in patients:
        for i in xrange(delay):
            p.update() 
        p.addPrescription('guttagonol')
        for i in xrange(150):
            p.update()
        viruspops.append(p.getTotalPop())

    pylab.hist(viruspops,10)
    pylab.show()

# simulationDelayedTreatment(100)


#
# PROBLEM 2
#
def simulationTwoDrugsDelayedTreatment(numTrials):
    """
    Runs simulations and make histograms for problem 2.

    Runs numTrials simulations to show the relationship between administration
    of multiple drugs and patient outcome.

    Histograms of final total virus populations are displayed for lag times of
    300, 150, 75, 0 timesteps between adding drugs (followed by an additional
    150 timesteps of simulation).

    numTrials: number of simulation runs to execute (an integer)
    """
    patients =  [TreatedPatient(viruses=[ResistantVirus(maxBirthProb=0.1,
                                                        clearProb=0.05,
                                                        resistances={'guttagonol': False, 'grimpex': False},
                                                        mutProb=0.1) 
                                        for x in xrange(100)],
                                maxPop=1000) for i in xrange(numTrials)]
    delay = 150
    viruspops = []
    for p in patients:
        for i in xrange(150):
            p.update()
        p.addPrescription('guttagonol')
        for i in xrange(delay):
            p.update() 
        p.addPrescription("grimpex")
        for i in xrange(150):
            p.update()
        viruspops.append(p.getTotalPop())

    pylab.hist(viruspops,10)
    pylab.show()

simulationTwoDrugsDelayedTreatment(100)