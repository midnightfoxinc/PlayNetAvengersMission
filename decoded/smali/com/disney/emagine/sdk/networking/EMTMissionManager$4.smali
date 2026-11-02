.class Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EMTMissionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EMTMissionManager;->receivePackageToMobile(ILjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field final synthetic val$deviceId:I

.field final synthetic val$packageId:Ljava/lang/String;

.field final synthetic val$version:I


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;ILjava/lang/Runnable;ILjava/lang/String;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .param p2, "id"    # I
    .param p3, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 1112
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iput p4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->val$deviceId:I

    iput-object p5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->val$packageId:Ljava/lang/String;

    iput p6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->val$version:I

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
    .line 1129
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 1130
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 5
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
    .line 1116
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 1118
    const/16 v1, 0xc8

    if-ne p1, v1, :cond_0

    .line 1120
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v0

    .line 1121
    .local v0, "metaData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iget v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->val$deviceId:I

    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->val$packageId:Ljava/lang/String;

    iget v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;->val$version:I

    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->receivePackageMetadata(Ljava/util/HashMap;ILjava/lang/String;I)V

    .line 1123
    .end local v0    # "metaData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method
