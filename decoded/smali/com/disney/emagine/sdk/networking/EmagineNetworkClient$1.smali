.class Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EmagineNetworkClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->unregisterDevice(ILcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field final synthetic val$success:Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .param p2, "id"    # I
    .param p3, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iput-object p4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;->val$success:Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;

    invoke-direct {p0, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>(ILjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V
    .locals 5
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
    .line 186
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    const/16 v1, 0x190

    if-ne p1, v1, :cond_0

    .line 188
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->clearKeyForSlot(B)Z

    .line 191
    :cond_0
    invoke-static {p3}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "response":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 195
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error unregistering "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v1, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 199
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 7
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
    .line 170
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v2

    const-string v3, "statusCode:[%d]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v1, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 174
    invoke-static {p3}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "response":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 178
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;->val$success:Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;

    invoke-virtual {v1, v0}, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->run(Ljava/lang/String;)V

    .line 180
    :cond_0
    return-void
.end method
