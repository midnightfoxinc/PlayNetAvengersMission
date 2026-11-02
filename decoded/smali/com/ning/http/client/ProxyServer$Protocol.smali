.class public final enum Lcom/ning/http/client/ProxyServer$Protocol;
.super Ljava/lang/Enum;
.source "ProxyServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ProxyServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Protocol"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/ProxyServer$Protocol;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/ProxyServer$Protocol;

.field public static final enum HTTP:Lcom/ning/http/client/ProxyServer$Protocol;

.field public static final enum HTTPS:Lcom/ning/http/client/ProxyServer$Protocol;

.field public static final enum KERBEROS:Lcom/ning/http/client/ProxyServer$Protocol;

.field public static final enum NTLM:Lcom/ning/http/client/ProxyServer$Protocol;

.field public static final enum SPNEGO:Lcom/ning/http/client/ProxyServer$Protocol;


# instance fields
.field private final protocol:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 34
    new-instance v0, Lcom/ning/http/client/ProxyServer$Protocol;

    const-string v1, "HTTP"

    const-string v2, "http"

    invoke-direct {v0, v1, v3, v2}, Lcom/ning/http/client/ProxyServer$Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/ning/http/client/ProxyServer$Protocol;->HTTP:Lcom/ning/http/client/ProxyServer$Protocol;

    new-instance v0, Lcom/ning/http/client/ProxyServer$Protocol;

    const-string v1, "HTTPS"

    const-string v2, "https"

    invoke-direct {v0, v1, v4, v2}, Lcom/ning/http/client/ProxyServer$Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/ning/http/client/ProxyServer$Protocol;->HTTPS:Lcom/ning/http/client/ProxyServer$Protocol;

    new-instance v0, Lcom/ning/http/client/ProxyServer$Protocol;

    const-string v1, "NTLM"

    const-string v2, "NTLM"

    invoke-direct {v0, v1, v5, v2}, Lcom/ning/http/client/ProxyServer$Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/ning/http/client/ProxyServer$Protocol;->NTLM:Lcom/ning/http/client/ProxyServer$Protocol;

    new-instance v0, Lcom/ning/http/client/ProxyServer$Protocol;

    const-string v1, "KERBEROS"

    const-string v2, "KERBEROS"

    invoke-direct {v0, v1, v6, v2}, Lcom/ning/http/client/ProxyServer$Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/ning/http/client/ProxyServer$Protocol;->KERBEROS:Lcom/ning/http/client/ProxyServer$Protocol;

    new-instance v0, Lcom/ning/http/client/ProxyServer$Protocol;

    const-string v1, "SPNEGO"

    const-string v2, "SPNEGO"

    invoke-direct {v0, v1, v7, v2}, Lcom/ning/http/client/ProxyServer$Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/ning/http/client/ProxyServer$Protocol;->SPNEGO:Lcom/ning/http/client/ProxyServer$Protocol;

    .line 33
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/ning/http/client/ProxyServer$Protocol;

    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->HTTP:Lcom/ning/http/client/ProxyServer$Protocol;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->HTTPS:Lcom/ning/http/client/ProxyServer$Protocol;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->NTLM:Lcom/ning/http/client/ProxyServer$Protocol;

    aput-object v1, v0, v5

    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->KERBEROS:Lcom/ning/http/client/ProxyServer$Protocol;

    aput-object v1, v0, v6

    sget-object v1, Lcom/ning/http/client/ProxyServer$Protocol;->SPNEGO:Lcom/ning/http/client/ProxyServer$Protocol;

    aput-object v1, v0, v7

    sput-object v0, Lcom/ning/http/client/ProxyServer$Protocol;->$VALUES:[Lcom/ning/http/client/ProxyServer$Protocol;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 39
    iput-object p3, p0, Lcom/ning/http/client/ProxyServer$Protocol;->protocol:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/ProxyServer$Protocol;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/ning/http/client/ProxyServer$Protocol;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/ProxyServer$Protocol;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/ProxyServer$Protocol;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/ning/http/client/ProxyServer$Protocol;->$VALUES:[Lcom/ning/http/client/ProxyServer$Protocol;

    invoke-virtual {v0}, [Lcom/ning/http/client/ProxyServer$Protocol;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/ProxyServer$Protocol;

    return-object v0
.end method


# virtual methods
.method public getProtocol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/ning/http/client/ProxyServer$Protocol;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/ning/http/client/ProxyServer$Protocol;->getProtocol()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
