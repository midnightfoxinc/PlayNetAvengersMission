.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EMTPortalLibraryController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->login(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 884
    const-class v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 884
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-direct {p0, p2}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V
    .locals 8
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
    .line 908
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

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

    .line 910
    invoke-static {p3}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v0

    .line 912
    .local v0, "error":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 914
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 916
    :cond_0
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
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 890
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "statusCode:[%d]"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    sget-boolean v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p3, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 894
    :cond_0
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v0

    .line 896
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    const-string v1, "accessToken"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$302(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/String;)Ljava/lang/String;

    .line 898
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->portalLibrary()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$300(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 899
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/AESjni;->sharedInstance()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/crypto/AESjni;->getProxyKey()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 898
    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->LoginWithAccessToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 901
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Success logging in access token \"%s\""

    new-array v4, v8, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$300(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 902
    return-void
.end method
