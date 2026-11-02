.class Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EmagineNetworkClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->requestFirmwareMetadata(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field final synthetic val$deviceId:I


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .param p2, "id"    # I
    .param p3, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 516
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iput p4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->val$deviceId:I

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
    .line 556
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 557
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 8
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
    .line 522
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

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

    .line 524
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v2, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 526
    packed-switch p1, :pswitch_data_0

    .line 540
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

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

    .line 541
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v0

    .line 543
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "event"

    const/16 v3, 0x69

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 547
    .local v1, "jsonData":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    const/16 v3, 0x15

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 550
    .end local v1    # "jsonData":Ljava/lang/String;
    :goto_0
    return-void

    .line 530
    .end local v0    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :pswitch_0
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v0

    .line 532
    .restart local v0    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v2, v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;->val$deviceId:I

    invoke-virtual {v2, v3, v0}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->downloadFirmware(ILjava/util/HashMap;)V

    goto :goto_0

    .line 526
    nop

    :pswitch_data_0
    .packed-switch 0xc8
        :pswitch_0
    .end packed-switch
.end method
