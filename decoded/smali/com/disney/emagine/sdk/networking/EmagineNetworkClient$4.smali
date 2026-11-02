.class Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EmagineNetworkClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sendRegisterHashToken(Ljava/lang/String;ILcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field final synthetic val$completion:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .param p2, "id"    # I
    .param p3, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 353
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iput-object p4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;->val$completion:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

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
    .line 377
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 378
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
    .line 359
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "statusCode:[%d]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v1, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 363
    const/16 v1, 0xc8

    if-ne p1, v1, :cond_0

    .line 365
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Success matching tokens."

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v0

    .line 369
    .local v0, "responseObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;->val$completion:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    invoke-virtual {v1, v0}, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->run(Ljava/util/HashMap;)V

    .line 371
    .end local v0    # "responseObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method
