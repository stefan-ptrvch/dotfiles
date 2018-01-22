# A small program that plays the notes that I want
# Used for training pitch recognition

import sys
import pyaudio
import numpy as np
import time
# Get note which has to be played
note = sys.argv[1]

# Dictionary with notes and respective fruequencies in one octave
frequencies = {'A': 440.0, 'W': 466.16, 'B': 493.88, 'C': 523.25, 'V': 554.37,
               'D': 587.33, 'R': 622.25, 'E': 659.25, 'F': 698.46, 'T': 739.99,
               'G': 783.99, 'Y': 830.61}

# Instantiate audio player
player = pyaudio.PyAudio()

# Set-up the audio palyer
volume = 0.5            # Range [0.0, 1.0]
fs = 44100              # Sampling rate
duration = 10.0         # Duration of signal in seconds
f = frequencies[note]   # Frequency of signal in Hz

# Generate numpy array of samples
samples = (np.sin(2*np.pi*np.arange(fs*duration)*f/fs)).astype(np.float32)

# Envelope to make sounds less poppy
envelope = np.ones(441000)

# Define envelope duration
env_length = 55000

# Exponential rise
rise = np.log10(np.linspace(1.001, 10, env_length))

envelope[:env_length] = rise
envelope[env_length:2*env_length] = np.array(list(reversed(rise)))

# Apply envelope
samples *= envelope

# Open, something?
stream = player.open(format=pyaudio.paFloat32, channels=1, rate=fs,
                     output=True)

# Play the sound
stream.write(volume*samples)

# Clean everything up
stream.stop_stream()
stream.close()
player.terminate()
