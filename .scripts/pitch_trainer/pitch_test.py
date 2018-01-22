# A small program that plays different pitches that I have to recognize

import pyaudio
import numpy as np

# Dictionary with notes and respective fruequencies in one octave
frequencies = {1: 440.0, 2: 466.16, 3: 493.88, 4: 523.25, 5: 554.37,
               6: 587.33, 7: 622.25, 8: 659.25, 9: 698.46, 10: 739.99,
               11: 783.99, 12: 830.61}

# Instantiate audio player
player = pyaudio.PyAudio()

# Set-up the audio palyer
volume = 0.5            # Range [0.0, 1.0]
fs = 44100              # Sampling rate
duration = 5.0          # Duration of signal in seconds

# Generate bunch of random numbers, in order to play random pitches
randoms = np.random.randint(low=1, high=12, size=7)

# Random numbers to insert known tones
known_randoms = np.random.randint(low=0, high=6, size=1)

# Envelope to make sounds less poppy
envelope = np.ones(220500)

# Exponential rise
rise = np.log10(np.linspace(1.1, 10, 50000))

envelope[:50000] = rise
envelope[-50000:] = np.array(list(reversed(rise)))

notes = []

for note in randoms:
    notes.append(frequencies[note])

notes[known_randoms[0]] = frequencies[9]

for note in notes:

    # Frequency of signal in Hz
    f = note

    # Generate numpy array of samples
    samples = (np.sin(2*np.pi*np.arange(fs*duration)*f/fs)).astype(np.float32)

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
