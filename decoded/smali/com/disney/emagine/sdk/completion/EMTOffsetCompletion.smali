.class public Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;
.super Ljava/lang/Object;
.source "EMTOffsetCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field completion:Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;

.field delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field filename:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/String;Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;)V
    .locals 0
    .param p1, "del"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .param p2, "fn"    # Ljava/lang/String;
    .param p3, "cb"    # Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .line 25
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->filename:Ljava/lang/String;

    .line 26
    iput-object p3, p0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->completion:Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;

    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 75
    return-void
.end method

.method public run(I)V
    .locals 28
    .param p1, "offset"    # I

    .prologue
    .line 31
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->transferredBytes()J

    move-result-wide v20

    .line 32
    .local v20, "transferredBytes":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->missionSizeFloat()D

    move-result-wide v14

    .line 33
    .local v14, "missionSizeFloat":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->previousPercent()I

    move-result v16

    .line 34
    .local v16, "previousPercent":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->averageVelocity()J

    move-result-wide v6

    .line 35
    .local v6, "averageVelocity":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->lastMeasuredTime()J

    move-result-wide v10

    .line 37
    .local v10, "lastMeasuredTime":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    move/from16 v0, p1

    int-to-long v0, v0

    move-wide/from16 v24, v0

    add-long v24, v24, v20

    move-object/from16 v0, v22

    move-wide/from16 v1, v24

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->setTransferredBytes(J)V

    .line 39
    move-wide/from16 v0, v20

    long-to-double v0, v0

    move-wide/from16 v22, v0

    div-double v22, v22, v14

    const-wide/high16 v24, 0x4059000000000000L    # 100.0

    mul-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-int v9, v0

    .line 42
    .local v9, "percent":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    sub-long v22, v22, v10

    const-wide/16 v24, 0x3e8

    div-long v22, v22, v24

    move-wide/from16 v0, v22

    long-to-float v8, v0

    .line 43
    .local v8, "lastDeltaTime":F
    move/from16 v0, p1

    int-to-float v0, v0

    move/from16 v22, v0

    div-float v22, v22, v8

    move/from16 v0, v22

    float-to-long v12, v0

    .line 46
    .local v12, "lastVelocity":J
    const-wide/16 v22, 0x708

    cmp-long v22, v12, v22

    if-lez v22, :cond_0

    .line 48
    const-wide/16 v12, 0x708

    .line 51
    :cond_0
    const-wide v4, 0x3f847ae147ae147bL    # 0.01

    .line 53
    .local v4, "SMOOTHING_FACTOR":D
    long-to-double v0, v12

    move-wide/from16 v22, v0

    mul-double v22, v22, v4

    const-wide/high16 v24, 0x3ff0000000000000L    # 1.0

    sub-double v24, v24, v4

    long-to-double v0, v6

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    add-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-long v6, v0

    .line 55
    move-wide/from16 v0, v20

    long-to-double v0, v0

    move-wide/from16 v22, v0

    sub-double v18, v14, v22

    .line 56
    .local v18, "remainingBytes":D
    long-to-double v0, v6

    move-wide/from16 v22, v0

    div-double v22, v18, v22

    move-wide/from16 v0, v22

    double-to-int v0, v0

    move/from16 v17, v0

    .line 58
    .local v17, "remainingTime":I
    if-gez v17, :cond_1

    .line 60
    const/16 v17, 0x0

    .line 63
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    move-object/from16 v0, v22

    move-wide/from16 v1, v24

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->setLastMeasuredTime(J)V

    .line 65
    move/from16 v0, v16

    if-eq v9, v0, :cond_2

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->completion:Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v17

    invoke-interface {v0, v1, v2, v9, v3}, Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZII)V

    .line 68
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->setPreviousPercent(I)V

    .line 70
    :cond_2
    return-void
.end method
