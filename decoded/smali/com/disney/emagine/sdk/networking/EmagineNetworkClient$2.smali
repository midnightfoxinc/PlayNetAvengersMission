.class Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EmagineNetworkClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->getRegisterUserTokenWithOwnerId(Ljava/lang/String;ISLcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field final synthetic val$deviceId:I

.field final synthetic val$success:Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ISLjava/lang/String;Ljava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .param p2, "id"    # I
    .param p3, "dt"    # S
    .param p4, "od"    # Ljava/lang/String;
    .param p5, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 244
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iput-object p6, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->val$success:Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;

    iput p7, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->val$deviceId:I

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>(ISLjava/lang/String;Ljava/lang/Runnable;)V

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
    .line 285
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 286
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 10
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
    const/4 v9, 0x0

    .line 250
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v3, v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "statusCode:[%d]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v3, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 254
    sparse-switch p1, :sswitch_data_0

    .line 279
    :goto_0
    return-void

    .line 257
    :sswitch_0
    if-nez p3, :cond_0

    .line 259
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v3, v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Error: Response Object is null"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 263
    :cond_0
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v1

    .line 264
    .local v1, "responseObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "encryptedToken"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 265
    .local v0, "encryptedToken":Ljava/lang/String;
    invoke-static {v0, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    .line 267
    .local v2, "token":[B
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v3, v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Success getting User Token: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->val$success:Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;

    invoke-virtual {v3, v2}, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;->run([B)V

    goto :goto_0

    .line 274
    .end local v0    # "encryptedToken":Ljava/lang/String;
    .end local v1    # "responseObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "token":[B
    :sswitch_1
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v3, v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Toy already registered, re-registering"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;->val$deviceId:I

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->reregisterDeviceId(I)V

    goto :goto_0

    .line 254
    nop

    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_0
        0xcc -> :sswitch_1
    .end sparse-switch
.end method
