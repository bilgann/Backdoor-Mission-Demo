#!/usr/bin/env python
"""Insert demo data directly into the production Supabase database"""

import os
import psycopg2
from datetime import date, datetime

# Get the Supabase database URL from environment
db_url = os.getenv('DATABASE_URL', 'postgresql://postgres:Admin2025!@localhost:5432/backdoor_mission_database')

try:
    # Connect to the database
    conn = psycopg2.connect(db_url)
    cur = conn.cursor()
    
    print(f"Connected to database")
    
    # Check the host
    cur.execute("SELECT inet_server_addr()")
    host = cur.fetchone()
    print(f'Server address: {host}')
    
    # Count existing washroom records for today
    cur.execute('SELECT COUNT(*) FROM washroom_records WHERE date >= %s', (date(2026, 1, 25),))
    count = cur.fetchone()
    print(f'Washroom records for today: {count[0]}')
    
    # Insert washroom records for today
    for hour in range(9, 18):
        cur.execute('''
            INSERT INTO washroom_records (client_id, washroom_type, time_in, time_out, date)
            VALUES (%s, %s, %s, %s, %s)
        ''', (1, 'S', datetime(2026, 1, 25, hour, 0), datetime(2026, 1, 25, hour, 30), date(2026, 1, 25)))
    
    # Insert coat check records for today
    for hour in range(8, 17):
        cur.execute('''
            INSERT INTO coat_check_records (client_id, bin_no, time_in, time_out, date)
            VALUES (%s, %s, %s, %s, %s)
        ''', (2, 100 + hour, datetime(2026, 1, 25, hour, 0), datetime(2026, 1, 25, hour + 1, 0), date(2026, 1, 25)))
    
    # Insert sanctuary records
    for hour in range(10, 15):
        cur.execute('''
            INSERT INTO sanctuary_records (client_id, date, time_in, time_out, purpose_of_visit, if_serviced)
            VALUES (%s, %s, %s, %s, %s, %s)
        ''', (3, date(2026, 1, 25), datetime(2026, 1, 25, hour, 0), datetime(2026, 1, 25, hour + 1, 0), 'Rest', True))
    
    conn.commit()
    print('Successfully inserted demo data for today')
    
    # Verify
    cur.execute('SELECT COUNT(*) FROM washroom_records WHERE date >= %s', (date(2026, 1, 25),))
    count = cur.fetchone()
    print(f'Washroom records for today after insert: {count[0]}')
    
    cur.close()
    conn.close()
    
except Exception as e:
    print(f'Error: {e}')
    import traceback
    traceback.print_exc()
