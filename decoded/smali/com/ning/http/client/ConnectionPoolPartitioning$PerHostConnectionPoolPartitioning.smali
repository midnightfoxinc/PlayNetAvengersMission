.class public final enum Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;
.super Ljava/lang/Enum;
.source "ConnectionPoolPartitioning.java"

# interfaces
.implements Lcom/ning/http/client/ConnectionPoolPartitioning;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ConnectionPoolPartitioning;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PerHostConnectionPoolPartitioning"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;",
        ">;",
        "Lcom/ning/http/client/ConnectionPoolPartitioning;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

.field public static final enum INSTANCE:Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 27
    new-instance v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;->INSTANCE:Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    .line 25
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    sget-object v1, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;->INSTANCE:Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    aput-object v1, v0, v2

    sput-object v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;->$VALUES:[Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;->$VALUES:[Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    invoke-virtual {v0}, [Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    return-object v0
.end method


# virtual methods
.method public getPartitionId(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;
    .locals 3
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "proxyServer"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 30
    invoke-static {p1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getBaseUrl(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "serverPart":Ljava/lang/String;
    if-eqz p2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcom/ning/http/client/ProxyServer;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v0    # "serverPart":Ljava/lang/String;
    :cond_0
    return-object v0
.end method
