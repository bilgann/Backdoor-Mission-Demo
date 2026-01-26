"""Debug endpoint to check database connection and data"""
import os
from app import app

@app.route('/debug/db', methods=['GET'])
def debug_db():
    """Debug endpoint to check database connection"""
    try:
        db_url = os.getenv('DATABASE_URL', 'not-set')
        # Mask the password
        masked_url = db_url.replace('@', ' [password] ')
        
        from app import db, WashroomRecord
        from datetime import date
        
        # Try to count washroom records
        count = db.session.query(WashroomRecord).filter(
            WashroomRecord.date >= date(2026, 1, 25)
        ).count()
        
        # Try to get the latest date
        latest = db.session.query(WashroomRecord.date).order_by(
            WashroomRecord.date.desc()
        ).first()
        
        return {
            'db_url': masked_url[:50] + '...',
            'washroom_count_today': count,
            'latest_date': str(latest[0]) if latest else None,
            'success': True
        }, 200
    except Exception as e:
        return {
            'error': str(e),
            'success': False
        }, 500
