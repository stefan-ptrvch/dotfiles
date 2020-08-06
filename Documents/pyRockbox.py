'''Used for submitting scrobbles from Rockbox .scrobbler.log file'''
import pylast
import csv
import time
from datetime import datetime, timedelta


# You have to have your own unique two values for API_KEY and API_SECRET
# Obtain yours from https://www.last.fm/api/account/create for Last.fm
API_KEY = "702c2d4278813beb8f6b47138134bbb5"  # this is a sample key
API_SECRET = "50ab6b670a74d621da6045dd58cd714e"

# In order to perform a write operation you need to authenticate yourself
username = "SirPetrovich"
password_hash = pylast.md5("madafaka")

# Create LastFM interface object
network = pylast.LastFMNetwork(
        api_key=API_KEY, api_secret=API_SECRET, username=username,
        password_hash=password_hash
        )

# Timestamp threshold, to check if some scrobbles were timestamped incorrectly
time_thresh = datetime.now() - timedelta(days=365)
current_time = datetime.now()
cumulative_time = 0

# Submit tracks
with open('./.scrobbler.log', newline='') as csvfile:
    csvstream = csv.reader(csvfile, delimiter='\t')
    for row in csvstream:
        # Check whether scrobble date is older than a year, and fix them if
        # they are
        timestamp = datetime.utcfromtimestamp(int(row[6]))
        if timestamp < time_thresh:
            cumulative_time += int(row[4])
            timestamp = current_time - timedelta(seconds=cumulative_time)
            timestamp = int(time.mktime(timestamp.timetuple()))
        timestamp = str(timestamp)

        # Submit track
        network.scrobble(
                artist=row[0],
                title=row[2],
                timestamp=timestamp,
                album=row[1]
                )
        print('Scrobbled:', row[2])


#34032 + 446 = 34478
