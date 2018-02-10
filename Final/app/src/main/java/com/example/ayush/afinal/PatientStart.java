package com.example.ayush.afinal;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.EditText;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.Query;
import com.google.firebase.database.ValueEventListener;

public class PatientStart extends AppCompatActivity {
    public final String TAG1 = "HI";
    FirebaseAuth mAuth;
    EditText patID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_patient_start);

        patID = findViewById(R.id.pat_id);
        mAuth = FirebaseAuth.getInstance();
        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("DoctorSchedule");

        FirebaseUser user = mAuth.getCurrentUser();
        String docid = user.getEmail();
        docid = docid.split("@")[0];

        DatabaseReference doctorref = myRef.child(docid);
        DatabaseReference query = doctorref;
        Query query1 = query.orderByChild("Date").equalTo("09/02/18");
        query1.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                for(DataSnapshot d :dataSnapshot.getChildren())
                {
                    DoctorScheduleEntry d1 = d.getValue(DoctorScheduleEntry.class);
                    Log.d(TAG1,d1.PatientID);
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {;

            }
        });
    }
}
