.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;
.super Ljava/lang/Object;
.source "EMTPortalLibraryController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->handleAnalyticsFile(Ljava/lang/String;J[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field final synthetic val$data:[B

.field final synthetic val$deviceId:J

.field final synthetic val$filename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;[BJLjava/lang/String;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 1123
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iput-object p2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$data:[B

    iput-wide p3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$deviceId:J

    iput-object p5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$filename:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 21

    .prologue
    .line 1126
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1128
    .local v11, "deserializedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const-string v16, "--"

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    .line 1129
    .local v9, "dash":[B
    const-string v16, "**"

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    .line 1130
    .local v5, "asterisk":[B
    const/4 v8, 0x0

    .line 1131
    .local v8, "bestSep":[B
    const/4 v7, 0x0

    .line 1135
    .local v7, "bestCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$data:[B

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v9}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$400(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;[B[B)I

    move-result v10

    .line 1136
    .local v10, "dashCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$data:[B

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$400(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;[B[B)I

    move-result v6

    .line 1138
    .local v6, "asteriskCount":I
    move v7, v10

    .line 1139
    move-object v8, v9

    .line 1141
    if-le v6, v10, :cond_0

    .line 1143
    move v7, v6

    .line 1144
    move-object v8, v5

    .line 1147
    :cond_0
    if-lez v7, :cond_3

    .line 1148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$data:[B

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-static {v0, v8}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->split([B[B)Ljava/util/List;

    move-result-object v13

    .line 1150
    .local v13, "list":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v16

    move/from16 v0, v16

    if-ge v12, v0, :cond_2

    .line 1151
    new-instance v15, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v15}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 1153
    .local v15, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, [B

    invoke-virtual/range {v15 .. v16}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeWithData([B)Ljava/lang/Object;

    move-result-object v14

    .line 1155
    .local v14, "pmpObj":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$deviceId:J

    move-wide/from16 v16, v0

    const-wide/16 v18, 0x0

    cmp-long v16, v16, v18

    if-lez v16, :cond_1

    if-eqz v14, :cond_1

    .line 1156
    check-cast v14, Ljava/util/HashMap;

    .end local v14    # "pmpObj":Ljava/lang/Object;
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1150
    :cond_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 1160
    .end local v15    # "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    :cond_2
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_3

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 1161
    .local v4, "analyticsEnvelope":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/disney/emagine/sdk/dmo/EMTAnalytics;->sharedInstance()Lcom/disney/emagine/sdk/dmo/EMTAnalytics;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$500(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Ljava/util/HashMap;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$600(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Ljava/util/HashMap;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;->val$filename:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/disney/emagine/sdk/dmo/EMTAnalytics;->processAnalyticsEnvelope(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)V

    goto :goto_1

    .line 1164
    .end local v4    # "analyticsEnvelope":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v12    # "i":I
    .end local v13    # "list":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_3
    return-void
.end method
