"""
Database initialization script for demo environment
This script creates all tables in the Supabase database
"""
import os
import sys

# Set demo environment variables (URL-encoded password: @ becomes %40)
os.environ['FLASK_APP'] = 'app'
os.environ['FLASK_DEBUG'] = 'False'
os.environ['DATABASE_URL'] = 'postgresql://postgres:977ShtBViE%40j9_E@db.atgzpesdgsfjbcknzwnk.supabase.co:5432/postgres'

from app import app, db

def init_database():
    """Initialize all database tables"""
    print("Connecting to Supabase database...")
    print(f"Database URL: {app.config['SQLALCHEMY_DATABASE_URI'][:50]}...")
    
    try:
        with app.app_context():
            print("\nCreating all tables...")
            db.create_all()
            print("✓ Database tables created successfully!")
            
            # Verify tables were created
            from sqlalchemy import inspect
            inspector = inspect(db.engine)
            tables = inspector.get_table_names()
            
            print(f"\n✓ Created {len(tables)} tables:")
            for table in sorted(tables):
                print(f"  - {table}")
            
            print("\n✓ Database initialization complete!")
            print("You can now start the backend server with: .\\start-backend-demo.ps1")
            
    except Exception as e:
        print(f"\n✗ Error initializing database: {str(e)}")
        sys.exit(1)

if __name__ == '__main__':
    init_database()
