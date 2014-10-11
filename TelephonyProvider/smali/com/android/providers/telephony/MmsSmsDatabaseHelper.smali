.class public Lcom/android/providers/telephony/MmsSmsDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "MmsSmsDatabaseHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;
    }
.end annotation


# static fields
.field private static sFakeLowStorageTest:Z

.field private static sInstance:Lcom/android/providers/telephony/MmsSmsDatabaseHelper;

.field private static sTriedAutoIncrement:Z


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mLowStorageMonitor:Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 121
    const/4 v0, 0x0

    sput-object v0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sInstance:Lcom/android/providers/telephony/MmsSmsDatabaseHelper;

    .line 122
    sput-boolean v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sTriedAutoIncrement:Z

    .line 123
    sput-boolean v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sFakeLowStorageTest:Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter

    .prologue
    .line 133
    const-string v0, "mmssms.db"

    const/4 v1, 0x0

    const/16 v2, 0x5a

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 134
    iput-object p1, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    .line 136
    invoke-direct {p0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->deleteOrphanedEntries()V

    .line 137
    return-void
.end method

.method static synthetic access$002(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 58
    sput-boolean p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sTriedAutoIncrement:Z

    return p0
.end method

.method public static checkToCreateBlockedThread(Landroid/database/sqlite/SQLiteDatabase;JJ)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 498
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_1

    .line 517
    :cond_0
    :goto_0
    return-void

    .line 501
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT * FROM blocked_threads WHERE _id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 503
    if-eqz v1, :cond_2

    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-lez v0, :cond_2

    .line 513
    :goto_1
    if-eqz v1, :cond_0

    .line 514
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 507
    :cond_2
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "INSERT INTO blocked_threads (_id, recipient_ids) VALUES ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\')"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 510
    :catch_0
    move-exception v0

    .line 511
    :try_start_2
    const-string v2, "MmsSmsDatabaseHelper"

    const-string v3, "Insert into blocked_threads err: "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 513
    if-eqz v1, :cond_0

    .line 514
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 513
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_3

    .line 514
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private createCommonTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 862
    const-string v0, "CREATE TABLE canonical_addresses (_id INTEGER PRIMARY KEY AUTOINCREMENT,address TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 869
    const-string v0, "CREATE TABLE private_addresses (_id INTEGER PRIMARY KEY AUTOINCREMENT,address TEXT,deleted INTEGER DEFAULT 0,sync_state INTEGER DEFAULT 0,marker INTEGER DEFAULT 0,source TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 885
    const-string v0, "CREATE TABLE threads (_id INTEGER PRIMARY KEY AUTOINCREMENT,date INTEGER DEFAULT 0,message_count INTEGER DEFAULT 0,unread_count INTEGER DEFAULT 0,recipient_ids TEXT,snippet TEXT,snippet_cs INTEGER DEFAULT 0,read INTEGER DEFAULT 1,type INTEGER DEFAULT 0,error INTEGER DEFAULT 0,has_attachment INTEGER DEFAULT 0,has_draft INTEGER DEFAULT 0,stick_time INTEGER DEFAULT 0,private_addr_ids TEXT DEFAULT NULL,last_sim_id INTEGER DEFAULT 0,sp_type INTEGER DEFAULT 0,sync_state INTEGER DEFAULT 0,marker INTEGER DEFAULT 0,source TEXT,mx_seq TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 907
    const-string v0, "CREATE TABLE blocked_threads (_id INTEGER PRIMARY KEY AUTOINCREMENT,recipient_ids TEXT,date INTEGER DEFAULT 0,message_count INTEGER DEFAULT 0,unread_count INTEGER DEFAULT 0,snippet TEXT,snippet_cs INTEGER DEFAULT 0,read INTEGER DEFAULT 1,last_sim_id INTEGER DEFAULT 0,type INTEGER DEFAULT 0,has_attachment INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 920
    const-string v0, "CREATE TABLE sim_cards (_id INTEGER PRIMARY KEY,sim_id INTEGER NOT NULL DEFAULT 0,number TEXT,bind_id INTEGER NOT NULL DEFAULT 0,marker1 INTEGER NOT NULL DEFAULT 0,marker2 INTEGER NOT NULL DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 931
    const-string v0, "CREATE TABLE pending_msgs (_id INTEGER PRIMARY KEY,proto_type INTEGER,msg_id INTEGER,msg_type INTEGER,err_type INTEGER,err_code INTEGER,retry_index INTEGER NOT NULL DEFAULT 0,due_time INTEGER,last_try INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 941
    return-void
.end method

.method private createCommonTriggers(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 998
    const-string v0, "CREATE TRIGGER insert_mms_pending_on_insert AFTER INSERT ON pdu WHEN new.m_type=130  OR new.m_type=135 BEGIN   INSERT INTO pending_msgs    (proto_type,     msg_id,     msg_type,     err_type,     err_code,     retry_index,     due_time)   VALUES     (1,      new._id,      new.m_type,0,0,0,0);END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1019
    const-string v0, "CREATE TRIGGER insert_mms_pending_on_update AFTER UPDATE ON pdu WHEN new.m_type=128  AND new.msg_box=4  AND old.msg_box!=4 BEGIN   INSERT INTO pending_msgs    (proto_type,     msg_id,     msg_type,     err_type,     err_code,     retry_index,     due_time)   VALUES     (1,      new._id,      new.m_type,0,0,0,0);END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1040
    const-string v0, "CREATE TRIGGER delete_mms_pending_on_update AFTER UPDATE ON pdu WHEN old.msg_box=4  AND new.msg_box!=4 BEGIN   DELETE FROM pending_msgs  WHERE msg_id=new._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1050
    const-string v0, "CREATE TRIGGER delete_mms_pending_on_delete  AFTER DELETE ON pdu  BEGIN   DELETE FROM pending_msgs  WHERE msg_id=old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1051
    const-string v0, "CREATE TRIGGER delete_mms_pending_on_mark  AFTER UPDATE of deleted ON pdu WHEN old.deleted = 0 AND new.deleted != 0 BEGIN   DELETE FROM pending_msgs  WHERE msg_id=old._id;  END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1052
    return-void
.end method

.method private createHmsTable(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 947
    const-string v0, "CREATE TABLE IF NOT EXISTS hms (_id INTEGER PRIMARY KEY,thread_id INTEGER,type INTEGER DEFAULT 0,date INTEGER,address TEXT,read INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,snippet TEXT,mx_type INTEGER,mx_extension TEXT,mx_content TEXT,advanced_seen INTEGER DEFAULT 0,mx_message_id TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 961
    return-void
.end method

.method private createIndices(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 659
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createThreadIdIndex(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 660
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createMiMsgIdIndex(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 661
    return-void
.end method

.method private createMiMsgIdIndex(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 673
    const-string v0, "CREATE INDEX IF NOT EXISTS mx_msgId_index_on_sms ON sms(mx_id)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 674
    const-string v0, "CREATE INDEX IF NOT EXISTS mx_msgId_index_on_pdu ON pdu(mx_id)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 675
    return-void
.end method

.method private createMmsTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 680
    const-string v0, "CREATE TABLE pdu (_id INTEGER PRIMARY KEY,thread_id INTEGER,date INTEGER,date_sent INTEGER DEFAULT 0,msg_box INTEGER,read INTEGER DEFAULT 0,m_id TEXT,sub TEXT,sub_cs INTEGER,ct_t TEXT,ct_l TEXT,exp INTEGER,m_cls TEXT,m_type INTEGER,v INTEGER,m_size INTEGER,pri INTEGER,rr INTEGER,rpt_a INTEGER,resp_st INTEGER,st INTEGER,tr_id TEXT,retr_st INTEGER,retr_txt TEXT,retr_txt_cs INTEGER,read_status INTEGER,ct_cls INTEGER,resp_txt TEXT,d_tm INTEGER,d_rpt INTEGER,locked INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,timed INTEGER DEFAULT 0,date_ms_part INTEGER DEFAULT 0,deleted INTEGER DEFAULT 0,sync_state INTEGER DEFAULT 0,marker INTEGER DEFAULT 0,source TEXT,bind_id INTEGER DEFAULT 0,mx_status INTEGER DEFAULT 0,mx_id INTEGER,file_id TEXT,need_download INTEGER DEFAULT 0,account TEXT,out_time INTEGER DEFAULT 0,snippet TEXT,preview_type INTEGER DEFAULT 0,preview_data BLOB,preview_data_ts INTEGER DEFAULT 0,sim_id INTEGER DEFAULT 0,block_type INTEGER DEFAULT 0,advanced_seen INTEGER DEFAULT 0,mx_type INTEGER DEFAULT 0,mx_extension TEXT,text_only INTEGER DEFAULT 0 );"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 737
    const-string v0, "CREATE TABLE addr (_id INTEGER PRIMARY KEY,msg_id INTEGER,contact_id INTEGER,address TEXT,type INTEGER,charset INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 745
    const-string v0, "CREATE TABLE part (_id INTEGER PRIMARY KEY,mid INTEGER,seq INTEGER DEFAULT 0,ct TEXT,name TEXT,chset INTEGER,cd TEXT,fn TEXT,cid TEXT,cl TEXT,ctt_s INTEGER,ctt_t TEXT,_data TEXT,text TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 761
    const-string v0, "CREATE TABLE rate (sent_time INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 764
    const-string v0, "CREATE TABLE drm (_id INTEGER PRIMARY KEY,_data TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 767
    return-void
.end method

.method private createMmsTriggers(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 770
    const-string v0, "CREATE TRIGGER cleanup_part_and_addr DELETE ON pdu BEGIN   DELETE FROM part  WHERE mid=old._id;  DELETE FROM addr  WHERE msg_id=old._id;END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 774
    const-string v0, "CREATE TRIGGER cleanup_delivery_and_read_report AFTER DELETE ON pdu WHEN old.m_type=128 BEGIN   DELETE FROM pdu  WHERE (m_type=134    OR m_type=136)    AND m_id=old.m_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 775
    const-string v0, "CREATE TRIGGER mark_delivery_and_read_report  AFTER UPDATE of deleted ON pdu WHEN old.m_type=128  BEGIN   UPDATE pdu SET deleted = new.deleted   WHERE (m_type=134    OR m_type=136)    AND m_id=old.m_id;  END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 777
    const-string v0, "CREATE TRIGGER on_file_id_change_trigger  AFTER UPDATE OF file_id ON pdu  WHEN new.file_id != null AND new.file_id != old.file_id  BEGIN   UPDATE pdu  SET need_download = (new.file_id != null AND new.file_id != \'\');   DELETE FROM part WHERE mid=old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 778
    return-void
.end method

.method private createSmsTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 783
    const-string v0, "CREATE TABLE sms (_id INTEGER PRIMARY KEY,thread_id INTEGER,pri INTEGER,address TEXT,person INTEGER,date INTEGER,date_sent INTEGER DEFAULT 0,protocol INTEGER,read INTEGER DEFAULT 0,status INTEGER DEFAULT -1,type INTEGER,reply_path_present INTEGER,subject TEXT,body TEXT,service_center TEXT,locked INTEGER DEFAULT 0,sub_id INTEGER DEFAULT 0,error_code INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,timed INTEGER DEFAULT 0,deleted INTEGER DEFAULT 0,sync_state INTEGER DEFAULT 0,marker INTEGER DEFAULT 0,source TEXT,bind_id INTEGER DEFAULT 0,mx_status INTEGER DEFAULT 0,mx_id INTEGER,out_time INTEGER DEFAULT 0,account TEXT,sim_id INTEGER DEFAULT 0,block_type INTEGER DEFAULT 0,advanced_seen INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 823
    const-string v0, "CREATE TABLE raw (_id INTEGER PRIMARY KEY,date INTEGER,reference_number INTEGER,count INTEGER,sequence INTEGER,destination_port INTEGER,address TEXT,sim_id INTEGER DEFAULT 0,pdu TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 834
    const-string v0, "CREATE TABLE attachments (sms_id INTEGER,content_url TEXT,offset INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 843
    const-string v0, "CREATE TABLE sr_pending (reference_number INTEGER,action TEXT,data TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 847
    return-void
.end method

.method private createThreadIdIndex(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter

    .prologue
    .line 665
    :try_start_0
    const-string v0, "CREATE INDEX IF NOT EXISTS typeThreadIdIndex ON sms (type, thread_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 670
    :goto_0
    return-void

    .line 667
    :catch_0
    move-exception v0

    .line 668
    const-string v1, "MmsSmsDatabaseHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "got exception creating indices: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static deleteEmptyBlockedThread(Landroid/database/sqlite/SQLiteDatabase;J)I
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 520
    const-string v0, "_id NOT IN (SELECT thread_id FROM sms WHERE ((thread_id is not null) AND deleted=1 AND block_type>1)UNION SELECT thread_id FROM pdu WHERE ((thread_id is not null) AND deleted=1 AND block_type>1)) "

    .line 524
    const-wide/16 v1, -0x1

    cmp-long v1, p1, v1

    if-eqz v1, :cond_0

    .line 525
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 528
    :cond_0
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 530
    :try_start_0
    const-string v1, "blocked_threads"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 531
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 533
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 535
    return v0

    .line 533
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
.end method

.method public static deleteObsoleteThread(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)I
    .locals 8
    .parameter
    .parameter
    .parameter

    .prologue
    const-wide/16 v6, -0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 425
    const-string v0, "stick_time=0 AND _id NOT IN (SELECT thread_id FROM sms WHERE (thread_id is not null) UNION SELECT thread_id FROM pdu WHERE (thread_id is not null) UNION SELECT thread_id FROM hms WHERE (thread_id is not null)) "

    .line 428
    invoke-static {p0}, Lcom/android/providers/telephony/MmsSmsUtils;->hasXiaomiAccount(Landroid/content/Context;)Z

    move-result v3

    .line 429
    if-eqz v3, :cond_0

    .line 430
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sync_state>=2 AND "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 433
    :cond_0
    cmp-long v3, p2, v6

    if-eqz v3, :cond_1

    .line 434
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " AND "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 437
    :cond_1
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 439
    :try_start_0
    const-string v3, "threads"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    .line 440
    const-string v0, "MmsSmsDatabaseHelper"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleted "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " obsolete threads"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    cmp-long v0, p2, v6

    if-nez v0, :cond_5

    .line 448
    const-string v0, "SELECT DISTINCT recipient_ids FROM threads"

    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v4

    .line 449
    if-eqz v4, :cond_5

    .line 452
    :try_start_1
    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_6

    .line 453
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 454
    const/4 v0, -0x1

    invoke-interface {v4, v0}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 455
    :cond_2
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 456
    const/4 v0, 0x0

    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 457
    const-string v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    move v0, v2

    .line 460
    :goto_0
    array-length v6, v5

    if-ge v0, v6, :cond_2

    .line 461
    aget-object v6, v5, v0

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    .line 462
    aget-object v6, v5, v0

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 460
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 466
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id NOT IN ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ","

    invoke-static {v2, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 469
    :goto_1
    :try_start_2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 471
    const-string v1, "canonical_addresses"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 472
    const-string v1, "MmsSmsDatabaseHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Deleted "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " obsolete canonical addresses"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    :cond_5
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 477
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 479
    return v3

    .line 469
    :catchall_0
    move-exception v0

    :try_start_3
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 477
    :catchall_1
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    :cond_6
    move-object v0, v1

    goto :goto_1
.end method

.method private deleteOrphanedEntries()V
    .locals 4

    .prologue
    .line 2677
    invoke-virtual {p0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2678
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 2680
    :try_start_0
    const-string v1, "sms"

    const-string v2, "thread_id NOT IN (SELECT _id from threads)"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2681
    const-string v1, "pdu"

    const-string v2, "thread_id NOT IN (SELECT _id from threads)"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2682
    const-string v1, "part"

    const-string v2, "mid NOT IN (SELECT _id from pdu)"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2683
    const-string v1, "addr"

    const-string v2, "msg_id NOT IN (SELECT _id from pdu)"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2684
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2686
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 2688
    return-void

    .line 2686
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
.end method

.method static declared-synchronized getInstance(Landroid/content/Context;)Lcom/android/providers/telephony/MmsSmsDatabaseHelper;
    .locals 2
    .parameter "context"

    .prologue
    .line 144
    const-class v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sInstance:Lcom/android/providers/telephony/MmsSmsDatabaseHelper;

    if-nez v0, :cond_0

    .line 145
    new-instance v0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;

    invoke-direct {v0, p0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sInstance:Lcom/android/providers/telephony/MmsSmsDatabaseHelper;

    .line 147
    :cond_0
    sget-object v0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sInstance:Lcom/android/providers/telephony/MmsSmsDatabaseHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private hasAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z
    .locals 6
    .parameter
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 2579
    .line 2580
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT sql FROM sqlite_master WHERE type=\'table\' AND name=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2582
    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 2583
    if-eqz v1, :cond_2

    .line 2585
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2586
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2587
    if-eqz v2, :cond_0

    const-string v0, "AUTOINCREMENT"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 2588
    :cond_0
    const-string v3, "MmsSmsDatabaseHelper"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[MmsSmsDb] tableName: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " hasAutoIncrement: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " result: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2592
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 2595
    :cond_2
    return v0

    .line 2592
    :catchall_0
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public static updateAllThreads(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 388
    if-nez p2, :cond_0

    .line 389
    const-string v0, ""

    .line 397
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT _id FROM threads WHERE _id IN (SELECT DISTINCT thread_id FROM sms "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 399
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 401
    :try_start_0
    invoke-virtual {p1, v0, p3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v1

    .line 402
    if-eqz v1, :cond_2

    .line 404
    :goto_1
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 405
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v2, v0

    invoke-static {p0, p1, v2, v3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThread(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 408
    :catchall_0
    move-exception v0

    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 414
    :catchall_1
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 391
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WHERE ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 408
    :cond_1
    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 411
    :cond_2
    const-wide/16 v0, -0x1

    invoke-static {p0, p1, v0, v1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->deleteObsoleteThread(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)I

    .line 412
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 414
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 416
    return-void
.end method

.method public static updateBlockedThreadLastSimId(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 6
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 603
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v2, "updateBlockedThreadLastSimId"

    invoke-direct {v0, v2}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 606
    :try_start_0
    const-string v2, "(m_type=132 OR m_type=130)"

    .line 610
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  SELECT sim_id FROM (      SELECT date * 1000 + date_ms_part AS date, sim_id FROM pdu WHERE deleted=1 AND block_type>1 AND thread_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(m_type=132 OR m_type=130)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "      UNION SELECT date, sim_id FROM sms WHERE deleted=1 AND block_type>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND thread_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  ORDER BY date DESC LIMIT 1;"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 617
    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 618
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 619
    const-string v3, "last_sim_id"

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 620
    const-string v3, "blocked_threads"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 627
    :goto_0
    if-eqz v1, :cond_0

    .line 628
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 631
    :cond_0
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 632
    return-void

    .line 622
    :cond_1
    :try_start_1
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 623
    const-string v3, "last_sim_id"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 624
    const-string v3, "blocked_threads"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 627
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_2

    .line 628
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method public static updateBlockedThreadMessageCount(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 4
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x1

    .line 539
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v1, "updateBlockedThreadMessageCount.1"

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 540
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  UPDATE blocked_threads SET message_count =      (SELECT COUNT(_id) FROM sms      WHERE sms.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND sms.block_type>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " AND sms.deleted=1) + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     (SELECT COUNT(_id) FROM pdu"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "      WHERE pdu.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND pdu.block_type>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " AND pdu.deleted=1) "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  WHERE blocked_threads._id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 549
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 550
    return-void
.end method

.method public static updateBlockedThreadSnippet(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 6
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 568
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v2, "updateBlockedThreadSnippet"

    invoke-direct {v0, v2}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 571
    :try_start_0
    const-string v2, "(m_type=128 OR m_type=132 OR m_type=130)"

    .line 576
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "   SELECT date, snippet, snippet_cs FROM (       SELECT date*1000 + date_ms_part AS date, sub AS snippet, sub_cs AS snippet_cs FROM pdu           WHERE deleted=1 AND block_type>1 AND thread_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(m_type=128 OR m_type=132 OR m_type=130)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "       UNION SELECT date, body AS snippet, 0 AS snippet_cs FROM sms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "           WHERE deleted=1 AND block_type>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND thread_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  ORDER BY date DESC LIMIT 1;"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 584
    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 585
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 586
    const-string v3, "date"

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 587
    const-string v3, "snippet"

    const/4 v4, 0x1

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    const-string v3, "snippet_cs"

    const/4 v4, 0x2

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 589
    const-string v3, "blocked_threads"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 595
    :goto_0
    if-eqz v1, :cond_0

    .line 596
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 599
    :cond_0
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 600
    return-void

    .line 592
    :cond_1
    :try_start_1
    const-string v2, "blocked_threads"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 595
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_2

    .line 596
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method public static updateBlockedThreadUnreadCount(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 4
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x1

    .line 553
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v1, "updateBlockedThreadUnreadCount.1"

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 554
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  UPDATE blocked_threads SET unread_count =      (SELECT COUNT(_id) FROM sms      WHERE sms.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND sms.block_type>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " AND sms.read=0 AND sms.deleted=1) +"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     (SELECT COUNT(_id) FROM pdu"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "      WHERE pdu.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND (m_type=132 OR m_type=130 OR m_type=128)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND pdu.block_type>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " AND pdu.read=0 AND pdu.deleted=1)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  WHERE blocked_threads._id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 564
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 565
    return-void
.end method

.method private updateDatabaseToVersion89(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2483
    const-string v0, "ALTER TABLE pdu ADD COLUMN text_only INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2485
    return-void
.end method

.method public static updateStickTime(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 6
    .parameter
    .parameter

    .prologue
    const-wide/16 v2, 0x0

    .line 272
    new-instance v4, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v0, "updateStickTime"

    invoke-direct {v4, v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT message_count FROM threads    WHERE threads._id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "    AND stick_time > 0 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 278
    if-nez v5, :cond_0

    .line 295
    :goto_0
    return-void

    .line 283
    :cond_0
    :try_start_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 284
    const/4 v0, 0x0

    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 287
    :goto_1
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 289
    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 290
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UPDATE threads SET stick_time = 0    WHERE threads._id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 294
    :cond_1
    invoke-virtual {v4}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    goto :goto_0

    .line 287
    :catchall_0
    move-exception v0

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_2
    move-wide v0, v2

    goto :goto_1
.end method

.method public static updateThread(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 3
    .parameter "context"
    .parameter "db"
    .parameter "threadId"

    .prologue
    const/4 v2, 0x0

    .line 151
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gez v0, :cond_0

    .line 152
    invoke-static {p0, p1, v2, v2}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateAllThreads(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)V

    .line 163
    :goto_0
    return-void

    .line 156
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadMessageCount(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 157
    invoke-static {p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadUnreadCount(Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 158
    invoke-static {p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadErrorState(Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 159
    invoke-static {p0, p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadSnippet(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 160
    invoke-static {p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadHasAttachment(Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 161
    invoke-static {p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadLastSimId(Landroid/database/sqlite/SQLiteDatabase;J)V

    .line 162
    invoke-static {p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateStickTime(Landroid/database/sqlite/SQLiteDatabase;J)V

    goto :goto_0
.end method

.method public static updateThreadErrorState(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 5
    .parameter
    .parameter

    .prologue
    .line 227
    new-instance v2, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v0, "updateThreadErrorState"

    invoke-direct {v2, v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT date*1000+date_ms_part AS date FROM pdu WHERE thread_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND deleted=0 AND ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "m_type"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " OR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "m_type"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x84

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " OR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "m_type"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x82

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") UNION SELECT date FROM sms WHERE thread_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND deleted=0 ORDER BY date DESC LIMIT 10"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 237
    if-nez v3, :cond_0

    .line 238
    const-string v0, "MmsSmsDatabaseHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot query recent 10 messages for thread "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    :cond_0
    const-wide/16 v0, 0x0

    .line 243
    :try_start_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToLast()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 244
    const/4 v0, 0x0

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 247
    :cond_1
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 251
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UPDATE threads SET error = CASE    (SELECT COUNT(msg_id) FROM pending_msgs JOIN pdu ON       pdu.thread_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " AND err_type >= 10 AND"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       pending_msgs.msg_id=pdu._id AND deleted=0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       AND date*1000+date_ms_part>="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") +"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "   (SELECT COUNT(_id) FROM pdu WHERE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       thread_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       AND msg_box="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       AND mx_status="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const v4, 0x20001

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " AND deleted=0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       AND date*1000+date_ms_part>="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") +"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "   (SELECT COUNT(_id) FROM sms WHERE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       thread_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       AND type="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "       AND deleted=0 AND date>="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "   WHEN 0 THEN 0 ELSE 1 END"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "   WHERE threads._id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 268
    invoke-virtual {v2}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 269
    return-void

    .line 247
    :catchall_0
    move-exception v0

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public static updateThreadHasAttachment(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 371
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v1, "updateThreadHasAttachment"

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 372
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  UPDATE threads SET has_attachment =    CASE     (SELECT COUNT(*) FROM part JOIN pdu      WHERE pdu.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     AND part.ct != \'text/plain\' AND part.ct != \'application/smil\' "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     AND part.mid = pdu._id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     AND pdu.deleted = 0)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "   WHEN 0 THEN 0 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "   ELSE 1 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "   END "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  WHERE threads._id ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 384
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 385
    return-void
.end method

.method public static updateThreadLastSimId(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 6
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 339
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v2, "updateThreadSnippet"

    invoke-direct {v0, v2}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 342
    :try_start_0
    const-string v2, "(m_type=128 OR m_type=132 OR m_type=130)"

    .line 347
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  SELECT sim_id FROM (      SELECT date * 1000 + date_ms_part AS date, sim_id FROM pdu WHERE deleted = 0 AND msg_box != 3 AND thread_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(m_type=128 OR m_type=132 OR m_type=130)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "      UNION SELECT date, sim_id FROM sms WHERE deleted = 0 AND type != 3 AND thread_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  ORDER BY date DESC LIMIT 1;"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 353
    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 354
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 355
    const-string v3, "last_sim_id"

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 356
    const-string v3, "threads"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 363
    :goto_0
    if-eqz v1, :cond_0

    .line 364
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 367
    :cond_0
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 368
    return-void

    .line 358
    :cond_1
    :try_start_1
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 359
    const-string v3, "last_sim_id"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 360
    const-string v3, "threads"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v3, v2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 363
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_2

    .line 364
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method public static updateThreadMessageCount(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 166
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v1, "updateThreadMessageCount.1"

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 170
    invoke-static {p0, p1, p2, p3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->deleteObsoleteThread(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)I

    move-result v1

    .line 171
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 172
    if-lez v1, :cond_0

    .line 200
    :goto_0
    return-void

    .line 177
    :cond_0
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v1, "updateThreadMessageCount.2"

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 178
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  UPDATE threads SET message_count =      (SELECT COUNT(_id) FROM sms      WHERE sms.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND sms.type != 3 AND sms.deleted = 0) + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     (SELECT COUNT(_id) FROM pdu"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "      WHERE pdu.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND (m_type=132 OR m_type=130 OR m_type=128)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND pdu.msg_box != 3 AND pdu.deleted = 0) + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     (SELECT COUNT(_id) FROM hms "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "       WHERE hms.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  WHERE threads._id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 190
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  UPDATE threads SET has_draft =      (SELECT COUNT(_id) FROM sms      WHERE sms.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND sms.type=3 AND sms.deleted = 0) + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     (SELECT COUNT(_id) FROM pdu"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "      WHERE pdu.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND pdu.msg_box = 3 AND pdu.deleted = 0) "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  WHERE threads._id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 199
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    goto/16 :goto_0
.end method

.method public static updateThreadSnippet(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 6
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 298
    new-instance v2, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v0, "updateThreadSnippet"

    invoke-direct {v2, v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 301
    :try_start_0
    const-string v0, "(m_type=128 OR m_type=132 OR m_type=130)"

    .line 306
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  SELECT date, snippet, snippet_cs, address FROM (      SELECT date * 1000 + date_ms_part AS date, sub AS snippet, sub_cs AS snippet_cs, NULL AS address FROM pdu WHERE deleted = 0 AND thread_id="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " AND "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "(m_type=128 OR m_type=132 OR m_type=130)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "      UNION SELECT date, body AS snippet, 0 AS snippet_cs, address FROM sms WHERE deleted = 0 AND thread_id="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "      UNION SELECT date, snippet , 0 AS snippet_cs, address FROM hms WHERE thread_id="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "  ORDER BY date DESC LIMIT 1;"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 313
    if-eqz v1, :cond_2

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 314
    new-instance v0, Landroid/content/ContentValues;

    const/4 v3, 0x3

    invoke-direct {v0, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 315
    const-string v3, "date"

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 316
    const-string v3, "snippet"

    const/4 v4, 0x1

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    const-string v3, "snippet_cs"

    const/4 v4, 0x2

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 318
    const/4 v3, 0x3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 319
    invoke-static {v3}, Lmiui/provider/ExtraTelephony;->isServiceNumber(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 320
    const-string v4, "sp_type"

    const/4 v5, 0x1

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v3, v5}, Lmiui/provider/ExtraTelephony;->getServiceCategory(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 322
    :cond_0
    const-string v3, "threads"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p1, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 331
    :goto_0
    if-eqz v1, :cond_1

    .line 332
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 335
    :cond_1
    invoke-virtual {v2}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 336
    return-void

    .line 324
    :cond_2
    :try_start_1
    new-instance v3, Landroid/content/ContentValues;

    const/4 v0, 0x3

    invoke-direct {v3, v0}, Landroid/content/ContentValues;-><init>(I)V

    .line 325
    const-string v0, "date"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 326
    const-string v4, "snippet"

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    const-string v4, "snippet_cs"

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    const-string v0, "threads"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p1, v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 331
    :catchall_0
    move-exception v0

    if-eqz v1, :cond_3

    .line 332
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method public static updateThreadUnreadCount(Landroid/database/sqlite/SQLiteDatabase;J)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 203
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v1, "updateThreadUnreadCount.1"

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 205
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  UPDATE threads SET unread_count =      (SELECT COUNT(_id) FROM sms      WHERE sms.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND sms.type=1 AND sms.read=0 AND sms.deleted=0) +"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     (SELECT COUNT(_id) FROM pdu"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "      WHERE pdu.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND (m_type=132 OR m_type=130 OR m_type=128)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "        AND pdu.msg_box=1 AND pdu.read=0 AND pdu.deleted = 0) + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "     (SELECT COUNT(_id) FROM hms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "       WHERE hms.thread_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "          AND hms.read=0)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  WHERE threads._id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 218
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 219
    new-instance v0, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;

    const-string v1, "updateThreadUnreadCount.2"

    invoke-direct {v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;-><init>(Ljava/lang/String;)V

    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UPDATE threads SET read = CASE unread_count WHEN 0 THEN 1 ELSE 0 END  WHERE threads._id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 223
    invoke-virtual {v0}, Lcom/android/providers/telephony/MmsSmsUtils$OperationPerfProfiler;->prof()V

    .line 224
    return-void
.end method

.method private updateThreadsAttachmentColumn(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 2670
    const-string v0, "UPDATE threads SET has_attachment=1 WHERE _id IN   (SELECT DISTINCT pdu.thread_id FROM part    JOIN pdu ON pdu._id=part.mid    WHERE part.ct != \'text/plain\' AND part.ct != \'application/smil\')"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2674
    return-void
.end method

.method private upgradeAddressTableToAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter

    .prologue
    .line 2634
    const-string v0, "canonical_addresses"

    invoke-direct {p0, p1, v0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->hasAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2635
    const-string v0, "MmsSmsDatabaseHelper"

    const-string v1, "[MmsSmsDb] upgradeAddressTableToAutoIncrement: already upgraded"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2649
    :goto_0
    return-void

    .line 2638
    :cond_0
    const-string v0, "MmsSmsDatabaseHelper"

    const-string v1, "[MmsSmsDb] upgradeAddressTableToAutoIncrement: upgrading"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2643
    const-string v0, "CREATE TABLE canonical_addresses_temp (_id INTEGER PRIMARY KEY AUTOINCREMENT,address TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2646
    const-string v0, "INSERT INTO canonical_addresses_temp SELECT * from canonical_addresses;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2647
    const-string v0, "DROP TABLE canonical_addresses;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2648
    const-string v0, "ALTER TABLE canonical_addresses_temp RENAME TO canonical_addresses;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private upgradeDatabaseToVersion41(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1836
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_move_mms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1837
    const-string v0, "CREATE TRIGGER update_threads_error_on_move_mms   BEFORE UPDATE OF msg_box ON pdu   WHEN (OLD.msg_box = 4 AND NEW.msg_box != 4)   AND (OLD._id IN (SELECT DISTINCT msg_id                   FROM pending_msgs                   WHERE err_type >= 10)) BEGIN   UPDATE threads SET error = error - 1  WHERE _id = OLD.thread_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1847
    return-void
.end method

.method private upgradeDatabaseToVersion42(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1850
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_on_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1851
    const-string v0, "DROP TRIGGER IF EXISTS delete_obsolete_threads_sms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1852
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_delete_sms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1853
    return-void
.end method

.method private upgradeDatabaseToVersion43(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1857
    const-string v0, "ALTER TABLE threads ADD COLUMN has_attachment INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1859
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadsAttachmentColumn(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1860
    return-void
.end method

.method private upgradeDatabaseToVersion44(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 1863
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadsAttachmentColumn(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1864
    return-void
.end method

.method private upgradeDatabaseToVersion45(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1868
    const-string v0, "ALTER TABLE sms ADD COLUMN locked INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1871
    const-string v0, "ALTER TABLE pdu ADD COLUMN locked INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1872
    return-void
.end method

.method private upgradeDatabaseToVersion46(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 9
    .parameter

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 1877
    const-string v0, "ALTER TABLE part ADD COLUMN text TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1879
    const-string v1, "part"

    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v3

    const-string v0, "_data"

    aput-object v0, v2, v5

    const/4 v0, 0x2

    const-string v3, "text"

    aput-object v3, v2, v0

    const-string v3, "ct = \'text/plain\' OR ct == \'application/smil\'"

    move-object v0, p1

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 1887
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1889
    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1890
    if-eqz v3, :cond_1

    .line 1891
    const-string v0, "_data"

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 1897
    :cond_0
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1898
    invoke-interface {v3, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 1899
    if-eqz v0, :cond_0

    .line 1901
    :try_start_1
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 1902
    invoke-virtual {v4}, Ljava/io/InputStream;->available()I

    move-result v5

    new-array v5, v5, [B

    .line 1903
    invoke-virtual {v4, v5}, Ljava/io/InputStream;->read([B)I

    .line 1904
    new-instance v6, Lcom/google/android/mms/pdu/EncodedStringValue;

    invoke-direct {v6, v5}, Lcom/google/android/mms/pdu/EncodedStringValue;-><init>([B)V

    .line 1905
    const-string v5, "UPDATE part SET _data = NULL, text = ?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual {v6}, Lcom/google/android/mms/pdu/EncodedStringValue;->getString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v7, v8

    invoke-virtual {p1, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1907
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 1908
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1909
    :catch_0
    move-exception v0

    .line 1911
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1918
    :catchall_0
    move-exception v0

    move-object v1, v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1919
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1921
    :try_start_3
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 1922
    :catch_1
    move-exception v2

    .line 1923
    const-string v5, "MmsSmsDatabaseHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "unable to clean up old mms file for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1916
    :cond_1
    :try_start_4
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1918
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1919
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1921
    :try_start_5
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_5
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_2

    .line 1922
    :catch_2
    move-exception v1

    .line 1923
    const-string v4, "MmsSmsDatabaseHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unable to clean up old mms file for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 1926
    :cond_2
    if-eqz v3, :cond_3

    .line 1927
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 1930
    :cond_3
    return-void

    .line 1926
    :cond_4
    if-eqz v3, :cond_5

    .line 1927
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v1
.end method

.method private upgradeDatabaseToVersion47(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 1933
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadsAttachmentColumn(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1934
    return-void
.end method

.method private upgradeDatabaseToVersion48(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1938
    const-string v0, "ALTER TABLE sms ADD COLUMN error_code INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1939
    return-void
.end method

.method private upgradeDatabaseToVersion51(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 5
    .parameter

    .prologue
    .line 1942
    const-string v0, "ALTER TABLE sms add COLUMN seen INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1943
    const-string v0, "ALTER TABLE pdu add COLUMN seen INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1948
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1949
    const-string v1, "seen"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1950
    const-string v1, "sms"

    const-string v2, "read=1"

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1951
    const-string v2, "MmsSmsDatabaseHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[MmsSmsDb] upgradeDatabaseToVersion51: updated "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " rows in sms table to have READ=1"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1953
    const-string v1, "pdu"

    const-string v2, "read=1"

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 1954
    const-string v1, "MmsSmsDatabaseHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[MmsSmsDb] upgradeDatabaseToVersion51: updated "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " rows in pdu table to have READ=1"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1959
    :goto_0
    return-void

    .line 1956
    :catch_0
    move-exception v0

    .line 1957
    const-string v1, "MmsSmsDatabaseHelper"

    const-string v2, "[MmsSmsDb] upgradeDatabaseToVersion51 caught "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private upgradeDatabaseToVersion53(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1962
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_read_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1963
    return-void
.end method

.method private upgradeDatabaseToVersion54(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1967
    const-string v0, "ALTER TABLE sms ADD COLUMN date_sent INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1970
    const-string v0, "ALTER TABLE pdu ADD COLUMN date_sent INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1971
    return-void
.end method

.method private upgradeDatabaseToVersion55(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1975
    const-string v0, "DROP TRIGGER IF EXISTS delete_obsolete_threads_pdu"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1976
    const-string v0, "DROP TRIGGER IF EXISTS delete_obsolete_threads_when_update_pdu"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1977
    return-void
.end method

.method private upgradeDatabaseToVersion56(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1981
    const-string v0, "ALTER TABLE threads ADD COLUMN unread_count INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1984
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_on_insert"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1985
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_on_insert"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1986
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_date_subject_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1987
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_date_subject_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1988
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_read_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1989
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_read_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1990
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_on_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1995
    const-string v0, "  UPDATE threads SET unread_count =   (SELECT COUNT(*) FROM sms   WHERE read =0      AND thread_id = threads._id) +   (SELECT COUNT(*) FROM pdu   WHERE read=0      AND thread_id = threads._id     AND (m_type=132 OR m_type=130 OR m_type=128)); "

    .line 2004
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2005
    return-void
.end method

.method private upgradeDatabaseToVersion57(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2010
    const-string v0, "ALTER TABLE pdu ADD COLUMN timed INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2011
    const-string v0, "ALTER TABLE sms ADD COLUMN timed INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2012
    return-void
.end method

.method private upgradeDatabaseToVersion58(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2015
    const-string v0, "ALTER TABLE pdu ADD COLUMN date_ms_part INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2017
    const-string v0, "ALTER TABLE pdu ADD COLUMN deleted INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2018
    const-string v0, "ALTER TABLE sms ADD COLUMN deleted INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2020
    const-string v0, "ALTER TABLE pdu ADD COLUMN sync_state INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2021
    const-string v0, "ALTER TABLE sms ADD COLUMN sync_state INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2023
    const-string v0, "ALTER TABLE pdu ADD COLUMN marker INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2024
    const-string v0, "ALTER TABLE sms ADD COLUMN marker INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2026
    const-string v0, "ALTER TABLE pdu ADD COLUMN source TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2027
    const-string v0, "ALTER TABLE sms ADD COLUMN source TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2029
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_on_insert"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2030
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_on_insert"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2031
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_date_subject_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2032
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_date_subject_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2033
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_read_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2034
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_read_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2035
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_on_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2037
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_insert_part"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2038
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_update_part"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2039
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_delete_part"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2040
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_update_pdu"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2041
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_delete_mms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2042
    const-string v0, "DROP TRIGGER IF EXISTS cleanup_delivery_and_read_report"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2043
    const-string v0, "DROP TRIGGER IF EXISTS delete_mms_pending_on_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2044
    return-void
.end method

.method private upgradeDatabaseToVersion59(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter

    .prologue
    .line 2047
    const-string v0, "MmsSmsDatabaseHelper"

    const-string v1, "Upgrade to 59"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2048
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_insert_part"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2049
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_update_part"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2050
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_delete_part"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2051
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_on_update_pdu"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2052
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_read_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2053
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_read_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2054
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_on_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2055
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_delete_mms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2056
    const-string v0, "DROP TRIGGER IF EXISTS cleanup_delivery_and_read_report"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2057
    const-string v0, "DROP TRIGGER IF EXISTS sms_words_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2058
    const-string v0, "DROP TRIGGER IF EXISTS sms_words_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2059
    const-string v0, "DROP TRIGGER IF EXISTS mms_words_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2060
    const-string v0, "DROP TRIGGER IF EXISTS mms_words_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2061
    const-string v0, "DROP TRIGGER IF EXISTS part_cleanup"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2062
    const-string v0, "DROP TRIGGER IF EXISTS addr_cleanup"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2063
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_update_mms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2064
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_move_mms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2065
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_update_sms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2066
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_on_insert"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2067
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_on_insert"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2068
    const-string v0, "DROP TRIGGER IF EXISTS pdu_update_thread_date_subject_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2069
    const-string v0, "DROP TRIGGER IF EXISTS sms_update_thread_date_subject_on_update"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2070
    const-string v0, "DROP TRIGGER IF EXISTS update_threads_error_on_move_mms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2071
    const-string v0, "DROP TRIGGER IF EXISTS delete_mms_pending_on_delete"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2073
    const-string v0, "CREATE INDEX thread_index_on_pdu ON pdu(msg_box,thread_id)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2074
    const-string v0, "CREATE INDEX msg_index_on_part ON part(mid)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2076
    const-string v0, "CREATE TRIGGER cleanup_delivery_and_read_report AFTER DELETE ON pdu WHEN old.m_type=128 BEGIN   DELETE FROM pdu  WHERE (m_type=134    OR m_type=136)    AND m_id=old.m_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2077
    const-string v0, "CREATE TRIGGER mark_delivery_and_read_report  AFTER UPDATE of deleted ON pdu WHEN old.m_type=128  BEGIN   UPDATE pdu SET deleted = new.deleted   WHERE (m_type=134    OR m_type=136)    AND m_id=old.m_id;  END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2078
    const-string v0, "CREATE TRIGGER delete_mms_pending_on_delete  AFTER DELETE ON pdu  BEGIN   DELETE FROM pending_msgs  WHERE msg_id=old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2079
    const-string v0, "CREATE TRIGGER delete_mms_pending_on_mark  AFTER UPDATE of deleted ON pdu WHEN old.deleted = 0 AND new.deleted != 0 BEGIN   DELETE FROM pending_msgs  WHERE msg_id=old._id;  END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2081
    const-string v0, "ALTER TABLE pdu ADD COLUMN bind_id INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2082
    const-string v0, "ALTER TABLE sms ADD COLUMN bind_id INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2084
    const-string v0, "CREATE TABLE sim_cards (_id INTEGER PRIMARY KEY,sim_id INTEGER NOT NULL DEFAULT 0,number TEXT,bind_id INTEGER NOT NULL DEFAULT 0,marker1 INTEGER NOT NULL DEFAULT 0,marker2 INTEGER NOT NULL DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2091
    return-void
.end method

.method private upgradeDatabaseToVersion60(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2096
    const-string v0, "DROP TRIGGER IF EXISTS part_cleanup"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2097
    const-string v0, "DROP TRIGGER IF EXISTS addr_cleanup"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2099
    const-string v0, "CREATE TRIGGER cleanup_part_and_addr DELETE ON pdu BEGIN   DELETE FROM part  WHERE mid=old._id;  DELETE FROM addr  WHERE msg_id=old._id;END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2100
    return-void
.end method

.method private upgradeDatabaseToVersion61(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2103
    const-string v0, "ALTER TABLE sms ADD COLUMN mx_status INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2104
    const-string v0, "ALTER TABLE sms ADD COLUMN mx_id INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2105
    const-string v0, "ALTER TABLE pdu ADD COLUMN mx_status INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2106
    const-string v0, "ALTER TABLE pdu ADD COLUMN mx_id INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2107
    const-string v0, "CREATE INDEX IF NOT EXISTS mx_msgId_index_on_sms ON sms(mx_id)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2108
    const-string v0, "CREATE INDEX IF NOT EXISTS mx_msgId_index_on_pdu ON pdu(mx_id)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2109
    return-void
.end method

.method private upgradeDatabaseToVersion62(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2112
    const-string v0, "ALTER TABLE pdu ADD COLUMN file_id TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2113
    const-string v0, "ALTER TABLE pdu ADD COLUMN need_download INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2114
    const-string v0, "CREATE TRIGGER on_file_id_change_trigger  AFTER UPDATE OF file_id ON pdu  WHEN new.file_id != null AND new.file_id != old.file_id  BEGIN   UPDATE pdu  SET need_download = (new.file_id != null AND new.file_id != \'\');   DELETE FROM part WHERE mid=old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2115
    return-void
.end method

.method private upgradeDatabaseToVersion63(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2118
    const-string v0, "ALTER TABLE sms ADD COLUMN out_time INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2119
    return-void
.end method

.method private upgradeDatabaseToVersion64(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2122
    const-string v0, "ALTER TABLE threads ADD COLUMN has_draft INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2123
    const-string v0, "UPDATE threads SET has_draft =      (SELECT COUNT(_id) FROM sms      WHERE sms.thread_id = threads._id        AND sms.type=3 AND sms.deleted = 0) +      (SELECT COUNT(_id) FROM pdu      WHERE pdu.thread_id = threads._id        AND pdu.msg_box = 3 AND pdu.deleted = 0) "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2130
    return-void
.end method

.method private upgradeDatabaseToVersion65(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter

    .prologue
    .line 2134
    const-string v0, "DELETE FROM sim_cards;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2135
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "mms_sync_wild_msg_state"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 2139
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "mms_sync_wild_numbers"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 2143
    return-void
.end method

.method private upgradeDatabaseToVersion66(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 2146
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 2147
    const-string v0, "date"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2148
    const-string v3, "snippet"

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2149
    const-string v3, "snippet_cs"

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2150
    const-string v0, "threads"

    const-string v3, "message_count=0 AND has_draft=0"

    invoke-virtual {p1, v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2151
    return-void
.end method

.method private upgradeDatabaseToVersion67(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 2154
    const-string v0, "ALTER TABLE sms ADD COLUMN account TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2155
    const-string v0, "ALTER TABLE pdu ADD COLUMN account TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2158
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2159
    const-string v1, "account"

    iget-object v2, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/android/providers/telephony/MmsSmsUtils;->getXiaomiAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2160
    const-string v1, "sms"

    const-string v2, "bind_id>0"

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2161
    const-string v1, "pdu"

    const-string v2, "bind_id>0"

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2162
    return-void
.end method

.method private upgradeDatabaseToVersion68(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2165
    const-string v0, "ALTER TABLE pdu ADD COLUMN out_time INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2166
    return-void
.end method

.method private upgradeDatabaseToVersion69(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2169
    const-string v0, "ALTER TABLE pdu ADD COLUMN snippet TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2170
    const-string v0, "ALTER TABLE pdu ADD COLUMN preview_type INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2171
    const-string v0, "ALTER TABLE pdu ADD COLUMN preview_data BLOB"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2172
    return-void
.end method

.method private upgradeDatabaseToVersion70(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 5
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 2176
    const-string v0, "m_type IS NULL"

    .line 2177
    const-string v2, "pdu"

    const-string v3, "thread_id"

    invoke-static {p1, v2, v3, v0, v1}, Lcom/android/providers/telephony/MmsSmsUtils;->queryLongValuesToSet(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v2

    .line 2179
    const-string v3, "pdu"

    invoke-virtual {p1, v3, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 2180
    if-lez v0, :cond_0

    .line 2181
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 2182
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v0, p1, v3, v4}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThread(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;J)V

    goto :goto_0

    .line 2187
    :cond_0
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 2188
    const-string v0, "preview_type"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2189
    const-string v3, "snippet"

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2190
    const-string v3, "preview_data"

    move-object v0, v1

    check-cast v0, [B

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2191
    const-string v0, "pdu"

    invoke-virtual {p1, v0, v2, v1, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2192
    return-void
.end method

.method private upgradeDatabaseToVersion71(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter "db"

    .prologue
    .line 2196
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2197
    .local v0, v:Landroid/content/ContentValues;
    const-string v1, "ct_t"

    const-string v2, "application/vnd.wap.multipart.related"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2198
    const-string v1, "pdu"

    const-string v2, "ct_t IS NULL AND (m_type=128 OR m_type=132)"

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2203
    return-void
.end method

.method private upgradeDatabaseToVersion72(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 2206
    const-string v0, "UPDATE threads SET error = CASE    (SELECT COUNT(msg_id) FROM pending_msgs JOIN pdu ON       pdu.thread_id=threads._id AND err_type >= 10 AND       pending_msgs.msg_id=pdu._id AND deleted=0) +   (SELECT COUNT(_id) FROM pdu WHERE       thread_id=threads._id       AND msg_box=2       AND mx_status=131073 AND deleted=0) +   (SELECT COUNT(_id) FROM sms WHERE       thread_id=threads._id       AND type=5       AND deleted=0)   WHEN 0 THEN 0 ELSE 1 END"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2220
    return-void
.end method

.method private upgradeDatabaseToVersion73(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter

    .prologue
    .line 2223
    const-string v0, "ALTER TABLE pdu ADD COLUMN preview_data_ts INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UPDATE pdu SET preview_data_ts="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " WHERE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "preview_data"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " IS NOT NULL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2227
    return-void
.end method

.method private upgradeDatabaseToVersion74(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2230
    const-string v0, "ALTER TABLE threads ADD COLUMN stick_time INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2231
    return-void
.end method

.method private upgradeDatabaseToVersion75(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2234
    const-string v0, "ALTER TABLE threads ADD COLUMN private_addr_ids TEXT DEFAULT NULL"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2235
    const-string v0, "ALTER TABLE pdu ADD COLUMN block_type INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2236
    const-string v0, "ALTER TABLE sms ADD COLUMN block_type INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2237
    const-string v0, "CREATE TABLE private_addresses (_id INTEGER PRIMARY KEY AUTOINCREMENT,address TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2240
    return-void
.end method

.method private upgradeDatabaseToVersion76(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2243
    const-string v0, "ALTER TABLE private_addresses ADD COLUMN deleted INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2244
    const-string v0, "ALTER TABLE private_addresses ADD COLUMN sync_state INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2245
    const-string v0, "ALTER TABLE private_addresses ADD COLUMN marker INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2246
    const-string v0, "ALTER TABLE private_addresses ADD COLUMN source TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2248
    const-string v0, "ALTER TABLE threads ADD COLUMN sync_state INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2249
    const-string v0, "ALTER TABLE threads ADD COLUMN marker INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2250
    const-string v0, "ALTER TABLE threads ADD COLUMN source TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2252
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/providers/telephony/MmsSmsUtils;->clearCommonMarkers(Landroid/content/Context;)V

    .line 2253
    return-void
.end method

.method private upgradeDatabaseToVersion77(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter

    .prologue
    .line 2256
    const-string v0, "threads"

    const-string v1, "_id"

    const-string v2, "error=1"

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lcom/android/providers/telephony/MmsSmsUtils;->queryLongValuesToSet(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v0

    .line 2258
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 2259
    invoke-static {p1, v2, v3}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateThreadErrorState(Landroid/database/sqlite/SQLiteDatabase;J)V

    goto :goto_0

    .line 2261
    :cond_0
    return-void
.end method

.method private upgradeDatabaseToVersion78(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2264
    const-string v0, "ALTER TABLE sim_cards RENAME TO old_sim_cards;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2265
    const-string v0, "CREATE TABLE sim_cards (_id INTEGER PRIMARY KEY,sim_id INTEGER NOT NULL DEFAULT 0,number TEXT,bind_id INTEGER NOT NULL DEFAULT 0,marker1 INTEGER NOT NULL DEFAULT 0,marker2 INTEGER NOT NULL DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2272
    const-string v0, "INSERT INTO sim_cards (number, bind_id, marker1, marker2) SELECT number, bind_id, marker1, marker2 FROM old_sim_cards;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2274
    const-string v0, "DROP TABLE old_sim_cards;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2275
    return-void
.end method

.method private upgradeDatabaseToVersion79(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 2280
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2281
    const-string v1, "preview_type"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2282
    const-string v1, "snippet"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 2283
    const-string v1, "preview_data"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 2284
    const-string v1, "pdu"

    invoke-virtual {p1, v1, v0, v3, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2285
    return-void
.end method

.method private upgradeDatabaseToVersion80(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2290
    const-string v0, "ALTER TABLE sms RENAME TO old_sms;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2291
    const-string v0, "ALTER TABLE pdu RENAME TO old_pdu;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2293
    const-string v0, "CREATE TABLE sms (_id INTEGER PRIMARY KEY,thread_id INTEGER,address TEXT,person INTEGER,date INTEGER,date_sent INTEGER DEFAULT 0,protocol INTEGER,read INTEGER DEFAULT 0,status INTEGER DEFAULT -1,type INTEGER,reply_path_present INTEGER,subject TEXT,body TEXT,service_center TEXT,locked INTEGER DEFAULT 0,error_code INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,timed INTEGER DEFAULT 0,deleted INTEGER DEFAULT 0,sync_state INTEGER DEFAULT 0,marker INTEGER DEFAULT 0,source TEXT,bind_id INTEGER DEFAULT 0,mx_status INTEGER DEFAULT 0,mx_id INTEGER,out_time INTEGER DEFAULT 0,account TEXT,sim_id INTEGER DEFAULT 0,block_type INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2328
    const-string v0, "CREATE TABLE pdu (_id INTEGER PRIMARY KEY,thread_id INTEGER,date INTEGER,date_sent INTEGER DEFAULT 0,msg_box INTEGER,read INTEGER DEFAULT 0,m_id TEXT,sub TEXT,sub_cs INTEGER,ct_t TEXT,ct_l TEXT,exp INTEGER,m_cls TEXT,m_type INTEGER,v INTEGER,m_size INTEGER,pri INTEGER,rr INTEGER,rpt_a INTEGER,resp_st INTEGER,st INTEGER,tr_id TEXT,retr_st INTEGER,retr_txt TEXT,retr_txt_cs INTEGER,read_status INTEGER,ct_cls INTEGER,resp_txt TEXT,d_tm INTEGER,d_rpt INTEGER,locked INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,timed INTEGER DEFAULT 0,date_ms_part INTEGER DEFAULT 0,deleted INTEGER DEFAULT 0,sync_state INTEGER DEFAULT 0,marker INTEGER DEFAULT 0,source TEXT,bind_id INTEGER DEFAULT 0,mx_status INTEGER DEFAULT 0,mx_id INTEGER,file_id TEXT,need_download INTEGER DEFAULT 0,account TEXT,out_time INTEGER DEFAULT 0,snippet TEXT,preview_type INTEGER DEFAULT 0,preview_data BLOB,preview_data_ts INTEGER DEFAULT 0,sim_id INTEGER DEFAULT 0,block_type INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2382
    const-string v0, "INSERT INTO sms (_id, thread_id, address, person, date, date_sent, protocol, read, status, type, reply_path_present, subject, body, service_center, locked, error_code, seen, timed, deleted, sync_state, marker, source, bind_id, mx_status, mx_id, out_time, account) SELECT _id, thread_id, address, person, date, date_sent, protocol, read, status, type, reply_path_present, subject, body, service_center, locked, error_code, seen, timed, deleted, sync_state, marker, source, bind_id, mx_status, mx_id, out_time, account FROM old_sms;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2388
    const-string v0, "INSERT INTO pdu (_id, thread_id, date, date_sent, msg_box, read, m_id, sub, sub_cs, ct_t, ct_l, exp, m_cls, m_type, v, m_size, pri, rr, rpt_a, resp_st, st, tr_id, retr_st, retr_txt, retr_txt_cs, read_status, ct_cls, resp_txt, d_tm, d_rpt, locked, seen, timed, date_ms_part, deleted, sync_state, marker, source, bind_id, mx_status, mx_id, file_id, need_download, account, out_time, snippet, preview_type, preview_data, preview_data_ts)SELECT _id, thread_id, date, date_sent, msg_box, read, m_id, sub, sub_cs, ct_t, ct_l, exp, m_cls, m_type, v, m_size, pri, rr, rpt_a, resp_st, st, tr_id, retr_st, retr_txt, retr_txt_cs, read_status, ct_cls, resp_txt, d_tm, d_rpt, locked, seen, timed, date_ms_part, deleted, sync_state, marker, source, bind_id, mx_status, mx_id, file_id, need_download, account, out_time, snippet, preview_type, preview_data, preview_data_ts FROM old_pdu;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2398
    const-string v0, "DROP TABLE old_sms;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2399
    const-string v0, "DROP TABLE old_pdu;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2400
    const-string v0, "CREATE TABLE blocked_threads (_id INTEGER PRIMARY KEY AUTOINCREMENT,recipient_ids TEXT,date INTEGER DEFAULT 0,message_count INTEGER DEFAULT 0,unread_count INTEGER DEFAULT 0,snippet TEXT,snippet_cs INTEGER DEFAULT 0,read INTEGER DEFAULT 1,last_sim_id INTEGER DEFAULT 0,type INTEGER DEFAULT 0,has_attachment INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2412
    return-void
.end method

.method private upgradeDatabaseToVersion81(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2416
    :try_start_0
    const-string v0, "ALTER TABLE pdu ADD COLUMN sim_id INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_2

    .line 2421
    :goto_0
    :try_start_1
    const-string v0, "ALTER TABLE sms ADD COLUMN sim_id INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2425
    :goto_1
    const-string v0, "ALTER TABLE threads ADD COLUMN last_sim_id INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2426
    const-string v0, "ALTER TABLE raw ADD COLUMN sim_id INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2428
    :try_start_2
    const-string v0, "ALTER TABLE sim_cards ADD COLUMN sim_id INTEGER NOT NULL DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 2432
    :goto_2
    return-void

    .line 2429
    :catch_0
    move-exception v0

    goto :goto_2

    .line 2422
    :catch_1
    move-exception v0

    goto :goto_1

    .line 2417
    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method private upgradeDatabaseToVersion82(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter

    .prologue
    .line 2436
    :try_start_0
    const-string v0, "ALTER TABLE blocked_threads ADD COLUMN last_sim_id INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2440
    :goto_0
    return-void

    .line 2437
    :catch_0
    move-exception v0

    .line 2438
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private upgradeDatabaseToVersion83(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2443
    const-string v0, "ALTER TABLE threads ADD COLUMN sp_type INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2444
    return-void
.end method

.method private upgradeDatabaseToVersion84(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2447
    const-string v0, "ALTER TABLE pdu ADD COLUMN advanced_seen INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2448
    const-string v0, "ALTER TABLE sms ADD COLUMN advanced_seen INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2449
    return-void
.end method

.method private upgradeDatabaseToVersion85(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2452
    const-string v0, "ALTER TABLE threads ADD COLUMN mx_seq TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2453
    const-string v0, "ALTER TABLE pdu ADD COLUMN mx_type INTEGER DEFAULT 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2454
    const-string v0, "ALTER TABLE pdu ADD COLUMN mx_extension TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2455
    return-void
.end method

.method private upgradeDatabaseToVersion87(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2473
    const-string v0, "ALTER TABLE hms ADD COLUMN mx_content TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2475
    return-void
.end method

.method private upgradeDatabaseToVersion88(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2478
    const-string v0, "ALTER TABLE hms ADD COLUMN mx_message_id TEXT"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2480
    return-void
.end method

.method private upgradeDatabasesToVersion86(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 2458
    const-string v0, "CREATE TABLE IF NOT EXISTS hms (_id INTEGER PRIMARY KEY,thread_id INTEGER,type INTEGER DEFAULT 0,date INTEGER,address TEXT,read INTEGER DEFAULT 0,seen INTEGER DEFAULT 0,snippet TEXT,mx_type INTEGER,mx_extension TEXT,advanced_seen INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2470
    return-void
.end method

.method private upgradeThreadsTableToAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .parameter

    .prologue
    .line 2603
    const-string v0, "threads"

    invoke-direct {p0, p1, v0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->hasAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2604
    const-string v0, "MmsSmsDatabaseHelper"

    const-string v1, "[MmsSmsDb] upgradeThreadsTableToAutoIncrement: already upgraded"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2627
    :goto_0
    return-void

    .line 2607
    :cond_0
    const-string v0, "MmsSmsDatabaseHelper"

    const-string v1, "[MmsSmsDb] upgradeThreadsTableToAutoIncrement: upgrading"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2612
    const-string v0, "CREATE TABLE threads_temp (_id INTEGER PRIMARY KEY AUTOINCREMENT,date INTEGER DEFAULT 0,message_count INTEGER DEFAULT 0,recipient_ids TEXT,snippet TEXT,snippet_cs INTEGER DEFAULT 0,read INTEGER DEFAULT 1,type INTEGER DEFAULT 0,error INTEGER DEFAULT 0,has_attachment INTEGER DEFAULT 0);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2624
    const-string v0, "INSERT INTO threads_temp SELECT * from threads;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2625
    const-string v0, "DROP TABLE threads;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 2626
    const-string v0, "ALTER TABLE threads_temp RENAME TO threads;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public dropAll(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter

    .prologue
    .line 1818
    const-string v0, "DROP TABLE IF EXISTS canonical_addresses"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1819
    const-string v0, "DROP TABLE IF EXISTS threads"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1820
    const-string v0, "DROP TABLE IF EXISTS pending_msgs"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1821
    const-string v0, "DROP TABLE IF EXISTS sms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1822
    const-string v0, "DROP TABLE IF EXISTS raw"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1823
    const-string v0, "DROP TABLE IF EXISTS attachments"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1824
    const-string v0, "DROP TABLE IF EXISTS threads"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1825
    const-string v0, "DROP TABLE IF EXISTS sr_pending"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1826
    const-string v0, "DROP TABLE IF EXISTS pdu;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1827
    const-string v0, "DROP TABLE IF EXISTS addr;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1828
    const-string v0, "DROP TABLE IF EXISTS part;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1829
    const-string v0, "DROP TABLE IF EXISTS rate;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1830
    const-string v0, "DROP TABLE IF EXISTS drm;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1831
    const-string v0, "DROP TABLE IF EXISTS sim_cards;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1832
    const-string v0, "DROP TABLE IF EXISTS hms"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1833
    return-void
.end method

.method public declared-synchronized getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 9

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 2491
    monitor-enter p0

    .line 2492
    const/16 v0, 0xc8

    move v8, v0

    move-object v0, v1

    move v1, v8

    :goto_0
    if-nez v0, :cond_0

    const/16 v4, 0x1900

    if-gt v1, v4, :cond_0

    .line 2494
    :try_start_0
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 2492
    :goto_1
    mul-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 2495
    :catch_0
    move-exception v4

    .line 2496
    :try_start_1
    const-string v4, "MmsSmsDatabaseHelper"

    const-string v5, "Cannot open database in writable mode, wait for another try."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2498
    int-to-long v4, v1

    :try_start_2
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 2499
    :catch_1
    move-exception v4

    goto :goto_1

    .line 2503
    :cond_0
    if-nez v0, :cond_1

    .line 2504
    :try_start_3
    new-instance v0, Landroid/database/sqlite/SQLiteException;

    const-string v1, "Tried many times, but I can\'t open the database in writable mode"

    invoke-direct {v0, v1}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2491
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2507
    :cond_1
    :try_start_4
    sget-boolean v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sTriedAutoIncrement:Z

    if-nez v1, :cond_2

    .line 2508
    const/4 v1, 0x1

    sput-boolean v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sTriedAutoIncrement:Z

    .line 2509
    const-string v1, "threads"

    invoke-direct {p0, v0, v1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->hasAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v1

    .line 2510
    const-string v4, "canonical_addresses"

    invoke-direct {p0, v0, v4}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->hasAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v5

    .line 2511
    const-string v4, "MmsSmsDatabaseHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[getWritableDatabase] hasAutoIncrementThreads: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " hasAutoIncrementAddresses: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2515
    if-nez v1, :cond_6

    .line 2516
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 2523
    :try_start_5
    invoke-direct {p0, v0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeThreadsTableToAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 2524
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2

    .line 2529
    :try_start_6
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    move v4, v2

    .line 2532
    :goto_2
    if-nez v5, :cond_5

    .line 2533
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 2540
    :try_start_7
    invoke-direct {p0, v0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeAddressTableToAutoIncrement(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 2541
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3

    .line 2547
    :try_start_8
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    move v1, v2

    .line 2550
    :goto_3
    if-eqz v4, :cond_3

    if-eqz v1, :cond_3

    .line 2551
    iget-object v1, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mLowStorageMonitor:Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;

    if-eqz v1, :cond_2

    .line 2553
    const-string v1, "MmsSmsDatabaseHelper"

    const-string v2, "Unregistering mLowStorageMonitor - we\'ve upgraded"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2554
    iget-object v1, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mLowStorageMonitor:Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 2555
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mLowStorageMonitor:Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 2574
    :cond_2
    :goto_4
    monitor-exit p0

    return-object v0

    .line 2525
    :catch_2
    move-exception v1

    .line 2526
    :try_start_9
    const-string v4, "MmsSmsDatabaseHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to add autoIncrement to threads;: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 2529
    :try_start_a
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    move v4, v3

    .line 2530
    goto :goto_2

    .line 2529
    :catchall_1
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 2542
    :catch_3
    move-exception v1

    .line 2543
    :try_start_b
    const-string v2, "MmsSmsDatabaseHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to add autoIncrement to canonical_addresses: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 2547
    :try_start_c
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    move v1, v3

    .line 2548
    goto :goto_3

    .line 2547
    :catchall_2
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v1

    .line 2558
    :cond_3
    sget-boolean v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sFakeLowStorageTest:Z

    if-eqz v1, :cond_4

    .line 2559
    const/4 v1, 0x0

    sput-boolean v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->sFakeLowStorageTest:Z

    .line 2564
    :cond_4
    iget-object v1, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mLowStorageMonitor:Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;

    if-nez v1, :cond_2

    .line 2565
    const-string v1, "MmsSmsDatabaseHelper"

    const-string v2, "[getWritableDatabase] turning on storage monitor"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2566
    new-instance v1, Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;

    invoke-direct {v1, p0}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;-><init>(Lcom/android/providers/telephony/MmsSmsDatabaseHelper;)V

    iput-object v1, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mLowStorageMonitor:Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;

    .line 2567
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 2568
    const-string v2, "android.intent.action.DEVICE_STORAGE_LOW"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 2569
    const-string v2, "android.intent.action.DEVICE_STORAGE_OK"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 2570
    iget-object v2, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mLowStorageMonitor:Lcom/android/providers/telephony/MmsSmsDatabaseHelper$LowStorageMonitor;

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_4

    :cond_5
    move v1, v2

    goto/16 :goto_3

    :cond_6
    move v4, v2

    goto/16 :goto_2
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .parameter

    .prologue
    .line 636
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createMmsTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 637
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createSmsTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 638
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createCommonTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 639
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createHmsTable(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 640
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createCommonTriggers(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 641
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createMmsTriggers(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 642
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createIndices(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 644
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "mms_sync_wild_msg_state"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 648
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "mms_sync_wild_numbers"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 653
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/providers/telephony/MmsSmsUtils;->clearOldMsgState(Landroid/content/Context;)V

    .line 654
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/providers/telephony/MmsSmsUtils;->clearWildMsgState(Landroid/content/Context;)V

    .line 655
    iget-object v0, p0, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/providers/telephony/MmsSmsUtils;->clearCommonMarkers(Landroid/content/Context;)V

    .line 656
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1056
    const-string v0, "MmsSmsDatabaseHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Upgrading database from version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1059
    packed-switch p2, :pswitch_data_0

    .line 1809
    :goto_0
    const-string v0, "MmsSmsDatabaseHelper"

    const-string v1, "Destroying all old data."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1810
    invoke-virtual {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->dropAll(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1811
    invoke-virtual {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1812
    :cond_0
    :goto_1
    return-void

    .line 1061
    :pswitch_0
    const/16 v0, 0x28

    if-le p3, v0, :cond_0

    .line 1065
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1067
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion41(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1068
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1073
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1077
    :pswitch_1
    const/16 v0, 0x29

    if-le p3, v0, :cond_0

    .line 1081
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1083
    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion42(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1084
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 1089
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1093
    :pswitch_2
    const/16 v0, 0x2a

    if-le p3, v0, :cond_0

    .line 1097
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1099
    :try_start_2
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion43(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1100
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 1105
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1109
    :pswitch_3
    const/16 v0, 0x2b

    if-le p3, v0, :cond_0

    .line 1113
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1115
    :try_start_3
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion44(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1116
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    .line 1121
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1125
    :pswitch_4
    const/16 v0, 0x2c

    if-le p3, v0, :cond_0

    .line 1129
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1131
    :try_start_4
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion45(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1132
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_4

    .line 1137
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1141
    :pswitch_5
    const/16 v0, 0x2d

    if-le p3, v0, :cond_0

    .line 1144
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1146
    :try_start_5
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion46(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1147
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_5

    .line 1152
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1156
    :pswitch_6
    const/16 v0, 0x2e

    if-le p3, v0, :cond_0

    .line 1160
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1162
    :try_start_6
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion47(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1163
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_6

    .line 1168
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1172
    :pswitch_7
    const/16 v0, 0x2f

    if-le p3, v0, :cond_0

    .line 1176
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1178
    :try_start_7
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion48(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1179
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_7

    .line 1184
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1188
    :pswitch_8
    const/16 v0, 0x30

    if-le p3, v0, :cond_0

    .line 1192
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1195
    :try_start_8
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_8

    .line 1200
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1204
    :pswitch_9
    const/16 v0, 0x31

    if-le p3, v0, :cond_0

    .line 1207
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1209
    :try_start_9
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->createThreadIdIndex(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1210
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_9

    .line 1215
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1219
    :pswitch_a
    const/16 v0, 0x32

    if-le p3, v0, :cond_0

    .line 1223
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1225
    :try_start_a
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion51(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1226
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_a

    .line 1231
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1235
    :pswitch_b
    const/16 v0, 0x33

    if-le p3, v0, :cond_0

    .line 1241
    :pswitch_c
    const/16 v0, 0x34

    if-le p3, v0, :cond_0

    .line 1245
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1247
    :try_start_b
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion53(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1248
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_b

    .line 1253
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1257
    :pswitch_d
    const/16 v0, 0x35

    if-le p3, v0, :cond_0

    .line 1261
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1263
    :try_start_c
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion54(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1264
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_c

    .line 1269
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1273
    :pswitch_e
    const/16 v0, 0x36

    if-le p3, v0, :cond_0

    .line 1277
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1279
    :try_start_d
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion55(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1280
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_d

    .line 1285
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1289
    :pswitch_f
    const/16 v0, 0x37

    if-le p3, v0, :cond_0

    .line 1293
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1295
    :try_start_e
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion56(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1296
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_e

    .line 1301
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1305
    :pswitch_10
    const/16 v0, 0x38

    if-le p3, v0, :cond_0

    .line 1309
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1311
    :try_start_f
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion57(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1312
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_f

    .line 1317
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1321
    :pswitch_11
    const/16 v0, 0x39

    if-le p3, v0, :cond_0

    .line 1325
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1327
    :try_start_10
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion58(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1328
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_10

    .line 1333
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1337
    :pswitch_12
    const/16 v0, 0x3a

    if-le p3, v0, :cond_0

    .line 1341
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1343
    :try_start_11
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion59(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1344
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_11
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_11

    .line 1349
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1353
    :pswitch_13
    const/16 v0, 0x3b

    if-le p3, v0, :cond_0

    .line 1357
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1359
    :try_start_12
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion60(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1360
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_12
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_12

    .line 1365
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1369
    :pswitch_14
    const/16 v0, 0x3c

    if-le p3, v0, :cond_0

    .line 1372
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1374
    :try_start_13
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion61(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1375
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_13
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_13

    .line 1380
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1384
    :pswitch_15
    const/16 v0, 0x3d

    if-le p3, v0, :cond_0

    .line 1387
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1389
    :try_start_14
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion62(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1390
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_14
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_14

    .line 1395
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1399
    :pswitch_16
    const/16 v0, 0x3e

    if-le p3, v0, :cond_0

    .line 1402
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1404
    :try_start_15
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion63(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1405
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_15
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_15

    .line 1410
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1414
    :pswitch_17
    const/16 v0, 0x3f

    if-le p3, v0, :cond_0

    .line 1417
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1419
    :try_start_16
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion64(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1420
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_16
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_16} :catch_16

    .line 1425
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1429
    :pswitch_18
    const/16 v0, 0x40

    if-le p3, v0, :cond_0

    .line 1432
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1434
    :try_start_17
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion65(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1435
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_17
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_17

    .line 1440
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1444
    :pswitch_19
    const/16 v0, 0x41

    if-le p3, v0, :cond_0

    .line 1447
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1449
    :try_start_18
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion66(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1450
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_18

    .line 1455
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1459
    :pswitch_1a
    const/16 v0, 0x42

    if-le p3, v0, :cond_0

    .line 1462
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1464
    :try_start_19
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion67(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1465
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_19
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_19

    .line 1470
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1474
    :pswitch_1b
    const/16 v0, 0x43

    if-le p3, v0, :cond_0

    .line 1477
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1479
    :try_start_1a
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion68(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1480
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_1a
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_1a

    .line 1485
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1489
    :pswitch_1c
    const/16 v0, 0x44

    if-le p3, v0, :cond_0

    .line 1492
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1494
    :try_start_1b
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion69(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1495
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_1b

    .line 1500
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1504
    :pswitch_1d
    const/16 v0, 0x45

    if-le p3, v0, :cond_0

    .line 1507
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1509
    :try_start_1c
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion70(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1510
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_1c
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_1c

    .line 1515
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1519
    :pswitch_1e
    const/16 v0, 0x46

    if-le p3, v0, :cond_0

    .line 1522
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1524
    :try_start_1d
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion71(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1525
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_1d
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_1d

    .line 1530
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1534
    :pswitch_1f
    const/16 v0, 0x47

    if-le p3, v0, :cond_0

    .line 1537
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1539
    :try_start_1e
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion72(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1540
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_1e

    .line 1545
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1549
    :pswitch_20
    const/16 v0, 0x48

    if-le p3, v0, :cond_0

    .line 1552
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1554
    :try_start_1f
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion73(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1555
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_1f
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_1f

    .line 1560
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1564
    :pswitch_21
    const/16 v0, 0x49

    if-le p3, v0, :cond_0

    .line 1567
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1569
    :try_start_20
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion74(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1570
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_20

    .line 1575
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1579
    :pswitch_22
    const/16 v0, 0x4a

    if-le p3, v0, :cond_0

    .line 1582
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1584
    :try_start_21
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion75(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1585
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_21
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_21

    .line 1590
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1594
    :pswitch_23
    const/16 v0, 0x4b

    if-le p3, v0, :cond_0

    .line 1597
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1599
    :try_start_22
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion76(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1600
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_22

    .line 1605
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1609
    :pswitch_24
    const/16 v0, 0x4c

    if-le p3, v0, :cond_0

    .line 1612
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1614
    :try_start_23
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion77(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1615
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_23
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_23

    .line 1620
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1624
    :pswitch_25
    const/16 v0, 0x4d

    if-le p3, v0, :cond_0

    .line 1627
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1629
    :try_start_24
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion78(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1630
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_24

    .line 1635
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1639
    :pswitch_26
    const/16 v0, 0x4e

    if-le p3, v0, :cond_0

    .line 1642
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1644
    :try_start_25
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion79(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1645
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_25
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_25

    .line 1650
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1653
    :pswitch_27
    const/16 v0, 0x4f

    if-le p3, v0, :cond_0

    .line 1656
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1658
    :try_start_26
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion80(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1659
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_26

    .line 1664
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1667
    :pswitch_28
    const/16 v0, 0x50

    if-le p3, v0, :cond_0

    .line 1670
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1672
    :try_start_27
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion81(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1673
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_27
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_27

    .line 1678
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1681
    :pswitch_29
    const/16 v0, 0x51

    if-le p3, v0, :cond_0

    .line 1684
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1686
    :try_start_28
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion82(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1687
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_28

    .line 1692
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1695
    :pswitch_2a
    const/16 v0, 0x52

    if-le p3, v0, :cond_0

    .line 1698
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1700
    :try_start_29
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion83(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1701
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_29
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_29

    .line 1706
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1709
    :pswitch_2b
    const/16 v0, 0x53

    if-le p3, v0, :cond_0

    .line 1712
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1714
    :try_start_2a
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion84(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1715
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_2a
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_2a

    .line 1720
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1723
    :pswitch_2c
    const/16 v0, 0x54

    if-le p3, v0, :cond_0

    .line 1726
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1728
    :try_start_2b
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion85(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1729
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_2b
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_2b

    .line 1734
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1737
    :pswitch_2d
    const/16 v0, 0x55

    if-le p3, v0, :cond_0

    .line 1740
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1742
    :try_start_2c
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabasesToVersion86(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1743
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_2c
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_2c

    .line 1748
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1751
    :pswitch_2e
    const/16 v0, 0x56

    if-le p3, v0, :cond_0

    .line 1754
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1756
    :try_start_2d
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabasesToVersion86(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1757
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_2d
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_2d} :catch_2d

    .line 1762
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1765
    :pswitch_2f
    const/16 v0, 0x57

    if-le p3, v0, :cond_0

    .line 1768
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1770
    :try_start_2e
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion87(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1771
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_2e
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_2e} :catch_2e

    .line 1776
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1779
    :pswitch_30
    const/16 v0, 0x58

    if-le p3, v0, :cond_0

    .line 1782
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1784
    :try_start_2f
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->upgradeDatabaseToVersion88(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1785
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_2f
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_2f} :catch_2f

    .line 1790
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1793
    :pswitch_31
    const/16 v0, 0x59

    if-le p3, v0, :cond_0

    .line 1796
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1798
    :try_start_30
    invoke-direct {p0, p1}, Lcom/android/providers/telephony/MmsSmsDatabaseHelper;->updateDatabaseToVersion89(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1799
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_30
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_30} :catch_30

    .line 1804
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_1

    .line 1069
    :catch_0
    move-exception v0

    .line 1070
    :try_start_31
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_0

    .line 1073
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1085
    :catch_1
    move-exception v0

    .line 1086
    :try_start_32
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_1

    .line 1089
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1101
    :catch_2
    move-exception v0

    .line 1102
    :try_start_33
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_2

    .line 1105
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_2
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1117
    :catch_3
    move-exception v0

    .line 1118
    :try_start_34
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_3

    .line 1121
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_3
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1133
    :catch_4
    move-exception v0

    .line 1134
    :try_start_35
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_4

    .line 1137
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_4
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1148
    :catch_5
    move-exception v0

    .line 1149
    :try_start_36
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_5

    .line 1152
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_5
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1164
    :catch_6
    move-exception v0

    .line 1165
    :try_start_37
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_6

    .line 1168
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_6
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1180
    :catch_7
    move-exception v0

    .line 1181
    :try_start_38
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_7

    .line 1184
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_7
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1196
    :catch_8
    move-exception v0

    .line 1197
    :try_start_39
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_8

    .line 1200
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_8
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1211
    :catch_9
    move-exception v0

    .line 1212
    :try_start_3a
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_9

    .line 1215
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_9
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1227
    :catch_a
    move-exception v0

    .line 1228
    :try_start_3b
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_a

    .line 1231
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_a
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1249
    :catch_b
    move-exception v0

    .line 1250
    :try_start_3c
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_b

    .line 1253
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_b
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1265
    :catch_c
    move-exception v0

    .line 1266
    :try_start_3d
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3d
    .catchall {:try_start_3d .. :try_end_3d} :catchall_c

    .line 1269
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_c
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1281
    :catch_d
    move-exception v0

    .line 1282
    :try_start_3e
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3e
    .catchall {:try_start_3e .. :try_end_3e} :catchall_d

    .line 1285
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_d
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1297
    :catch_e
    move-exception v0

    .line 1298
    :try_start_3f
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3f
    .catchall {:try_start_3f .. :try_end_3f} :catchall_e

    .line 1301
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_e
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1313
    :catch_f
    move-exception v0

    .line 1314
    :try_start_40
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_40
    .catchall {:try_start_40 .. :try_end_40} :catchall_f

    .line 1317
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_f
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1329
    :catch_10
    move-exception v0

    .line 1330
    :try_start_41
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_41
    .catchall {:try_start_41 .. :try_end_41} :catchall_10

    .line 1333
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_10
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1345
    :catch_11
    move-exception v0

    .line 1346
    :try_start_42
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_42
    .catchall {:try_start_42 .. :try_end_42} :catchall_11

    .line 1349
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_11
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1361
    :catch_12
    move-exception v0

    .line 1362
    :try_start_43
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_43
    .catchall {:try_start_43 .. :try_end_43} :catchall_12

    .line 1365
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_12
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1376
    :catch_13
    move-exception v0

    .line 1377
    :try_start_44
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_44
    .catchall {:try_start_44 .. :try_end_44} :catchall_13

    .line 1380
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_13
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1391
    :catch_14
    move-exception v0

    .line 1392
    :try_start_45
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_45
    .catchall {:try_start_45 .. :try_end_45} :catchall_14

    .line 1395
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_14
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1406
    :catch_15
    move-exception v0

    .line 1407
    :try_start_46
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_46
    .catchall {:try_start_46 .. :try_end_46} :catchall_15

    .line 1410
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_15
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1421
    :catch_16
    move-exception v0

    .line 1422
    :try_start_47
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_47
    .catchall {:try_start_47 .. :try_end_47} :catchall_16

    .line 1425
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_16
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1436
    :catch_17
    move-exception v0

    .line 1437
    :try_start_48
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_48
    .catchall {:try_start_48 .. :try_end_48} :catchall_17

    .line 1440
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_17
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1451
    :catch_18
    move-exception v0

    .line 1452
    :try_start_49
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_49
    .catchall {:try_start_49 .. :try_end_49} :catchall_18

    .line 1455
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_18
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1466
    :catch_19
    move-exception v0

    .line 1467
    :try_start_4a
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4a
    .catchall {:try_start_4a .. :try_end_4a} :catchall_19

    .line 1470
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_19
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1481
    :catch_1a
    move-exception v0

    .line 1482
    :try_start_4b
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4b
    .catchall {:try_start_4b .. :try_end_4b} :catchall_1a

    .line 1485
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_1a
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1496
    :catch_1b
    move-exception v0

    .line 1497
    :try_start_4c
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4c
    .catchall {:try_start_4c .. :try_end_4c} :catchall_1b

    .line 1500
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_1b
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1511
    :catch_1c
    move-exception v0

    .line 1512
    :try_start_4d
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4d
    .catchall {:try_start_4d .. :try_end_4d} :catchall_1c

    .line 1515
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_1c
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1526
    :catch_1d
    move-exception v0

    .line 1527
    :try_start_4e
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4e
    .catchall {:try_start_4e .. :try_end_4e} :catchall_1d

    .line 1530
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_1d
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1541
    :catch_1e
    move-exception v0

    .line 1542
    :try_start_4f
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4f
    .catchall {:try_start_4f .. :try_end_4f} :catchall_1e

    .line 1545
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_1e
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1556
    :catch_1f
    move-exception v0

    .line 1557
    :try_start_50
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_50
    .catchall {:try_start_50 .. :try_end_50} :catchall_1f

    .line 1560
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_1f
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1571
    :catch_20
    move-exception v0

    .line 1572
    :try_start_51
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_51
    .catchall {:try_start_51 .. :try_end_51} :catchall_20

    .line 1575
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_20
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1586
    :catch_21
    move-exception v0

    .line 1587
    :try_start_52
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_52
    .catchall {:try_start_52 .. :try_end_52} :catchall_21

    .line 1590
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_21
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1601
    :catch_22
    move-exception v0

    .line 1602
    :try_start_53
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_53
    .catchall {:try_start_53 .. :try_end_53} :catchall_22

    .line 1605
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_22
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1616
    :catch_23
    move-exception v0

    .line 1617
    :try_start_54
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_54
    .catchall {:try_start_54 .. :try_end_54} :catchall_23

    .line 1620
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_23
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1631
    :catch_24
    move-exception v0

    .line 1632
    :try_start_55
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_55
    .catchall {:try_start_55 .. :try_end_55} :catchall_24

    .line 1635
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_24
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1646
    :catch_25
    move-exception v0

    .line 1647
    :try_start_56
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_56
    .catchall {:try_start_56 .. :try_end_56} :catchall_25

    .line 1650
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_25
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1660
    :catch_26
    move-exception v0

    .line 1661
    :try_start_57
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_57
    .catchall {:try_start_57 .. :try_end_57} :catchall_26

    .line 1664
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_26
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1674
    :catch_27
    move-exception v0

    .line 1675
    :try_start_58
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_58
    .catchall {:try_start_58 .. :try_end_58} :catchall_27

    .line 1678
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_27
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1688
    :catch_28
    move-exception v0

    .line 1689
    :try_start_59
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_59
    .catchall {:try_start_59 .. :try_end_59} :catchall_28

    .line 1692
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_28
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1702
    :catch_29
    move-exception v0

    .line 1703
    :try_start_5a
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5a
    .catchall {:try_start_5a .. :try_end_5a} :catchall_29

    .line 1706
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_29
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1716
    :catch_2a
    move-exception v0

    .line 1717
    :try_start_5b
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5b
    .catchall {:try_start_5b .. :try_end_5b} :catchall_2a

    .line 1720
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_2a
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1730
    :catch_2b
    move-exception v0

    .line 1731
    :try_start_5c
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5c
    .catchall {:try_start_5c .. :try_end_5c} :catchall_2b

    .line 1734
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_2b
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1744
    :catch_2c
    move-exception v0

    .line 1745
    :try_start_5d
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5d
    .catchall {:try_start_5d .. :try_end_5d} :catchall_2c

    .line 1748
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_2c
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1758
    :catch_2d
    move-exception v0

    .line 1759
    :try_start_5e
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5e
    .catchall {:try_start_5e .. :try_end_5e} :catchall_2d

    .line 1762
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_2d
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1772
    :catch_2e
    move-exception v0

    .line 1773
    :try_start_5f
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5f
    .catchall {:try_start_5f .. :try_end_5f} :catchall_2e

    .line 1776
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_2e
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1786
    :catch_2f
    move-exception v0

    .line 1787
    :try_start_60
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_60
    .catchall {:try_start_60 .. :try_end_60} :catchall_2f

    .line 1790
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_2f
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1800
    :catch_30
    move-exception v0

    .line 1801
    :try_start_61
    const-string v1, "MmsSmsDatabaseHelper"

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_61
    .catchall {:try_start_61 .. :try_end_61} :catchall_30

    .line 1804
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_0

    :catchall_30
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 1059
    :pswitch_data_0
    .packed-switch 0x28
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_1b
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
        :pswitch_20
        :pswitch_21
        :pswitch_22
        :pswitch_23
        :pswitch_24
        :pswitch_25
        :pswitch_26
        :pswitch_27
        :pswitch_28
        :pswitch_29
        :pswitch_2a
        :pswitch_2b
        :pswitch_2c
        :pswitch_2d
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
    .end packed-switch
.end method
