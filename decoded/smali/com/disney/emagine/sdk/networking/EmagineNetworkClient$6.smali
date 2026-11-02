.class Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EmagineNetworkClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sendHeartbeat(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field final synthetic val$deviceId:I

.field final synthetic val$firmwareVersion:I


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .param p2, "id"    # I
    .param p3, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 438
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iput p4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->val$firmwareVersion:I

    iput p5, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->val$deviceId:I

    invoke-direct {p0, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>(ILjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V
    .locals 1
    .param p1, "statusCode"    # I
    .param p3, "content"    # [B
    .param p4, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;[B",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 496
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 497
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 9
    .param p1, "statusCode"    # I
    .param p3, "content"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;[B)V"
        }
    .end annotation

    .prologue
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    const/16 v8, 0x15

    .line 444
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v2, v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v3

    const-string v4, "statusCode:[%d]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v2, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 448
    sparse-switch p1, :sswitch_data_0

    .line 486
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v2, v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Other response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    :goto_0
    return-void

    .line 452
    :sswitch_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v2, v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Heartbeat: New updates available!"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v0

    .line 456
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "event"

    const/16 v3, 0x65

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    const-string v2, "fw_version"

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v3

    iget v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->val$firmwareVersion:I

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->convertFirmwareVersionToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    const-string v2, "device_id"

    iget v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->val$deviceId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 462
    .local v1, "jsonData":Ljava/lang/String;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v2, v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    invoke-virtual {v2, v8, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 469
    .end local v0    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "jsonData":Ljava/lang/String;
    :sswitch_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v2, v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Heartbeat: no new firmware or content"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 473
    .restart local v0    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "event"

    const/16 v3, 0x68

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    const-string v2, "fw_version"

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v3

    iget v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->val$firmwareVersion:I

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->convertFirmwareVersionToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    const-string v2, "device_id"

    iget v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->val$deviceId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 479
    .restart local v1    # "jsonData":Ljava/lang/String;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v2, v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    invoke-virtual {v2, v8, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 448
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0xcc -> :sswitch_1
    .end sparse-switch
.end method
