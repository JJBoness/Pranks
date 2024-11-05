#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

reminders := [
    "Warning: You should lock your computer.",
    "Warning: Someone was here.",
    "Warning: Your laptop is a magnet for mischief.",
    "Warning: Unattended screens lead to spontaneous creation.",
    "Warning: Leaving your computer open is a dare for pranks.",
    "Warning: Beware of curious minds lurking nearby.",
    "Warning: An unlocked computer is an open invitation to chaos.",
    "Warning: This laptop is not a safe space for your secrets.",
    "Warning: If you leave it open, they will come.",
    "Warning: Your keyboard is a canvas for creativity (and chaos).",
    "Warning: Unattended devices attract playful spirits.",
    "Warning: Your open screen could inspire an artistic masterpiece... or a meme.",
    "Warning: Every second your laptop is unlocked is a chance for shenanigans.",
    "Warning: Curious hands may find your browser history amusing.",
    "Warning: Leaving your computer unlocked is a chance for a prankster's delight.",
    "Warning: Your laptop is not a fortress; lock it up!",
    "Warning: This is a prime target for prank warfare.",
    "Warning: Open laptops are a call to action for the mischievous.",
    "Warning: A wandering eye may lead to unwanted edits!",
    "Warning: Your screen is a stage; don’t give others the spotlight.",
    "Warning: A blank screen is an open book for storytellers.",
    "Warning: Unattended computers may lead to regrettable selfies.",
    "Warning: Your device is an adventure waiting to happen… for someone else.",
    "Warning: Leaving your laptop open invites spontaneous group projects.",
    "Warning: Your desktop icons may end up in a new arrangement.",
    "Warning: Unlocked devices attract pranksters like moths to a flame.",
    "Warning: Your personal space is on display; guard it fiercely!",
    "Warning: An unlocked laptop is like a buffet for the bored.",
    "Warning: Your screen could become the canvas for a chaotic artist!",
    "Warning: Leave it open, and your secrets will be revealed.",
    "Warning: Laptops left unattended become targets for funny edits.",
    "Warning: The ghost of pranks past may haunt your screen.",
    "Warning: Leaving your laptop alone is asking for a remix!",
    "Warning: An open laptop is a challenge for clever minds.",
    "Warning: Your next big surprise could come from an innocent glance.",
    "Warning: Laptops left unattended are ripe for 'creative' problem-solving.",
    "Warning: Unsecured devices are playgrounds for the curious.",
    "Warning: Your laptop could inspire a new trend... or a disaster.",
    "Warning: Leaving it open is a call to adventurous spirits.",
    "Warning: Your laptop could be the next stage for an unexpected performance.",
    "Warning: Unlocked screens may lead to unsolicited advice!",
    "Warning: Leaving your laptop unlocked is a silent invitation to chaos.",
    "Warning: This device is a portal to mischief; close it wisely.",
    "Warning: Your keyboard might be transformed into a musical instrument.",
    "Warning: An open laptop is a canvas for the creative and the chaotic.",
    "Warning: Your screen could become a gallery of 'what not to do'.",
    "Warning: Leaving your computer open is a recipe for surprise shenanigans.",
    "Warning: Every unattended moment is an opportunity for playful creativity.",
    "Warning: An open laptop invites the curious to rewrite your story.",
    "Warning: Remember, curiosity killed the laptop!",
    "Warning: These, were AI generated."
]

file_names := [
    "Important_Math_Stuff.docx",
    "TotallyNotAVirus.exe",
    "Delete_This_Immediately.txt",
    "Please_Read_Me.pdf",
    "Very_Important_Info.jpg",
    "Final_Final_Final.docx",
    "Do_Not_OpenThis!.docx",
    "Mystery_Solved.pptx",
    "TopSecret_Passwords.txt",
    "My_Life_Savings.xlsx",
    "If_Found_Call.docx",
    "Evidence.doc",
    "You_Are_Watched.txt",
    "Random_Confession.doc",
    "Open_Me_First!!.doc",
    "Secret_Project.ppt",
    "Oops_Ignore_This.pdf",
    "Totally_Legit_File.exe",
    "Random_Project.docx",
    "Private_Info.txt",
    "To_Do_List.xlsx",
    "Last_Will.doc",
    "Homework_Not_Finished.pdf",
    "Petition_For_Chocolate.docx",
    "My_Passwords.txt",
    "Do_Not_Delete!!.exe",
    "Confidential_Document.pdf",
    "Fake_Evidence.ppt",
    "Oh_No!.txt",
    "Backup_of_Backup.bak",
    "Not_Suspicious.jpg",
    "Undercover_Agenda.docx",
    "Hidden_Secrets.pptx",
    "Personal_Diary.doc",
    "Super_Important.docx",
    "Forbidden_Knowledge.txt",
    "Just_A_Normal_File.txt",
    "Private_Notes.doc",
    "The_Meaning_Of_Life.doc",
    "Error_Report.exe",
    "Final_Answer.pptx",
    "Help_Me.doc",
    "Totally_Harmless.txt",
    "Serious_Info.pdf",
    "Secret_Lair_Location.txt",
    "DonotReadThis.docx",
    "Unfinished_Business.doc",
    "Nothing_To_See_Here.pdf",
    "TheTruth.doc",
    "Weird_Math_Problem.xls",
    "Mystery_Document.doc"
]


Timer_Start()

Timer_Start() {
    SetTimer(Hour_Timer, Random(1800000, 3600000)) ; 30 to 60 minutes
    ;SetTimer(Hour_Timer, Random(5000, 1000)) ; 5 to 10 Secons
}

Hour_Timer() {
    MsgBox(reminders[Random(1, reminders.Length)], "Errors have occurred", 262192)

    FileAppend("", A_Desktop . "\" . file_names[Random(1, file_names.Length)])
    Timer_Start()
}