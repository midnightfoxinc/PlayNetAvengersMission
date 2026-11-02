.class final Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
.super Ljava/lang/Object;
.source "RequestBuilderBase.java"

# interfaces
.implements Lcom/ning/http/client/Request;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/RequestBuilderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RequestImpl"
.end annotation


# instance fields
.field private address:Ljava/net/InetAddress;

.field private bodyGenerator:Lcom/ning/http/client/BodyGenerator;

.field private byteData:[B

.field public charset:Ljava/lang/String;

.field private compositeByteData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end field

.field private connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

.field private cookies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end field

.field private file:Ljava/io/File;

.field private followRedirects:Ljava/lang/Boolean;

.field private formParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation
.end field

.field private headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

.field private length:J

.field private localAddress:Ljava/net/InetAddress;

.field private method:Ljava/lang/String;

.field private parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;"
        }
    .end annotation
.end field

.field public proxyServer:Lcom/ning/http/client/ProxyServer;

.field private queryParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation
.end field

.field private rangeOffset:J

.field private realm:Lcom/ning/http/client/Realm;

.field private requestTimeout:I

.field private streamData:Ljava/io/InputStream;

.field private stringData:Ljava/lang/String;

.field private uri:Lcom/ning/http/client/uri/Uri;

.field private virtualHost:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 63
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->length:J

    .line 71
    sget-object v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;->INSTANCE:Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    .line 75
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/Request;)V
    .locals 4
    .param p1, "prototype"    # Lcom/ning/http/client/Request;

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 63
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->length:J

    .line 71
    sget-object v0, Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;->INSTANCE:Lcom/ning/http/client/ConnectionPoolPartitioning$PerHostConnectionPoolPartitioning;

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    .line 78
    if-eqz p1, :cond_0

    .line 79
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->method:Ljava/lang/String;

    .line 80
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->uri:Lcom/ning/http/client/uri/Uri;

    .line 81
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->address:Ljava/net/InetAddress;

    .line 82
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->localAddress:Ljava/net/InetAddress;

    .line 83
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getCookies()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->cookies:Ljava/util/ArrayList;

    .line 85
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->byteData:[B

    .line 86
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getCompositeByteData()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->compositeByteData:Ljava/util/List;

    .line 87
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStringData()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->stringData:Ljava/lang/String;

    .line 88
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStreamData()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->streamData:Ljava/io/InputStream;

    .line 89
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->bodyGenerator:Lcom/ning/http/client/BodyGenerator;

    .line 90
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    move-object v0, v1

    :goto_0
    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->formParams:Ljava/util/List;

    .line 91
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_2

    :goto_1
    iput-object v1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->parts:Ljava/util/List;

    .line 92
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->virtualHost:Ljava/lang/String;

    .line 93
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getContentLength()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->length:J

    .line 94
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getProxyServer()Lcom/ning/http/client/ProxyServer;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->proxyServer:Lcom/ning/http/client/ProxyServer;

    .line 95
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->realm:Lcom/ning/http/client/Realm;

    .line 96
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->file:Ljava/io/File;

    .line 97
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFollowRedirect()Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->followRedirects:Ljava/lang/Boolean;

    .line 98
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRequestTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->requestTimeout:I

    .line 99
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRangeOffset()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->rangeOffset:J

    .line 100
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyEncoding()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->charset:Ljava/lang/String;

    .line 101
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    .line 103
    :cond_0
    return-void

    .line 90
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    .line 91
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_1
.end method

.method static synthetic access$002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->method:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->uri:Lcom/ning/http/client/uri/Uri;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->compositeByteData:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/uri/Uri;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->uri:Lcom/ning/http/client/uri/Uri;

    return-object p1
.end method

.method static synthetic access$1102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->stringData:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/io/InputStream;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->streamData:Ljava/io/InputStream;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/io/InputStream;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->streamData:Ljava/io/InputStream;

    return-object p1
.end method

.method static synthetic access$1302(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/BodyGenerator;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Lcom/ning/http/client/BodyGenerator;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->bodyGenerator:Lcom/ning/http/client/BodyGenerator;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->parts:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1402(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->parts:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$1502(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/io/File;)Ljava/io/File;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->file:Ljava/io/File;

    return-object p1
.end method

.method static synthetic access$1602(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->realm:Lcom/ning/http/client/Realm;

    return-object p1
.end method

.method static synthetic access$1702(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/lang/Boolean;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->followRedirects:Ljava/lang/Boolean;

    return-object p1
.end method

.method static synthetic access$1802(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;I)I
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->requestTimeout:I

    return p1
.end method

.method static synthetic access$1902(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;J)J
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # J

    .prologue
    .line 48
    iput-wide p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->rangeOffset:J

    return-wide p1
.end method

.method static synthetic access$2002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/ConnectionPoolPartitioning;)Lcom/ning/http/client/ConnectionPoolPartitioning;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Lcom/ning/http/client/ConnectionPoolPartitioning;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    return-object p1
.end method

.method static synthetic access$202(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/net/InetAddress;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->address:Ljava/net/InetAddress;

    return-object p1
.end method

.method static synthetic access$302(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/net/InetAddress;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->localAddress:Ljava/net/InetAddress;

    return-object p1
.end method

.method static synthetic access$402(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->virtualHost:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    return-object v0
.end method

.method static synthetic access$502(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    return-object p1
.end method

.method static synthetic access$600(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)J
    .locals 2
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .prologue
    .line 48
    iget-wide v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->length:J

    return-wide v0
.end method

.method static synthetic access$602(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;J)J
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # J

    .prologue
    .line 48
    iput-wide p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->length:J

    return-wide p1
.end method

.method static synthetic access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->cookies:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$702(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->cookies:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$800(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->formParams:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$802(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->formParams:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$902(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;[B)[B
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    .param p1, "x1"    # [B

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->byteData:[B

    return-object p1
.end method


# virtual methods
.method public getBodyEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public getBodyGenerator()Lcom/ning/http/client/BodyGenerator;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->bodyGenerator:Lcom/ning/http/client/BodyGenerator;

    return-object v0
.end method

.method public getByteData()[B
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->byteData:[B

    return-object v0
.end method

.method public getCompositeByteData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 138
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->compositeByteData:Ljava/util/List;

    return-object v0
.end method

.method public getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 154
    iget-wide v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->length:J

    return-wide v0
.end method

.method public getCookies()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->cookies:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->cookies:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->file:Ljava/io/File;

    return-object v0
.end method

.method public getFollowRedirect()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->followRedirects:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getFormParams()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->formParams:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->formParams:Ljava/util/List;

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    return-object v0
.end method

.method public getInetAddress()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->address:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->localAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getParts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;"
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->parts:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->parts:Ljava/util/List;

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getProxyServer()Lcom/ning/http/client/ProxyServer;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->proxyServer:Lcom/ning/http/client/ProxyServer;

    return-object v0
.end method

.method public getQueryParams()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->queryParams:Ljava/util/List;

    if-nez v5, :cond_2

    .line 205
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v5}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 206
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->queryParams:Ljava/util/List;

    .line 207
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v5}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v5

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v4, v0, v1

    .line 208
    .local v4, "queryStringParam":Ljava/lang/String;
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 209
    .local v3, "pos":I
    if-gtz v3, :cond_0

    .line 210
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->queryParams:Ljava/util/List;

    new-instance v6, Lcom/ning/http/client/Param;

    const/4 v7, 0x0

    invoke-direct {v6, v4, v7}, Lcom/ning/http/client/Param;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 212
    :cond_0
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->queryParams:Ljava/util/List;

    new-instance v6, Lcom/ning/http/client/Param;

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, v3, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/ning/http/client/Param;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 215
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "pos":I
    .end local v4    # "queryStringParam":Ljava/lang/String;
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    iput-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->queryParams:Ljava/util/List;

    .line 216
    :cond_2
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->queryParams:Ljava/util/List;

    return-object v5
.end method

.method public getRangeOffset()J
    .locals 2

    .prologue
    .line 190
    iget-wide v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->rangeOffset:J

    return-wide v0
.end method

.method public getRealm()Lcom/ning/http/client/Realm;
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->realm:Lcom/ning/http/client/Realm;

    return-object v0
.end method

.method public getRequestTimeout()I
    .locals 1

    .prologue
    .line 186
    iget v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->requestTimeout:I

    return v0
.end method

.method public getStreamData()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->streamData:Ljava/io/InputStream;

    return-object v0
.end method

.method public getStringData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->stringData:Ljava/lang/String;

    return-object v0
.end method

.method public getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->uri:Lcom/ning/http/client/uri/Uri;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v0}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVirtualHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->virtualHost:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 221
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 223
    .local v3, "sb":Ljava/lang/StringBuilder;
    const-string v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    iget-object v4, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    const-string v4, "\theaders:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    iget-object v4, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-static {v4}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Map;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 227
    iget-object v4, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v4}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 228
    .local v1, "name":Ljava/lang/String;
    const-string v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    iget-object v4, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    const-string v5, ", "

    invoke-virtual {v4, v1, v5}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getJoinedValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 234
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->formParams:Ljava/util/List;

    invoke-static {v4}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 235
    const-string v4, "\tformParams:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    iget-object v4, p0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->formParams:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/Param;

    .line 237
    .local v2, "param":Lcom/ning/http/client/Param;
    const-string v4, "\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    invoke-virtual {v2}, Lcom/ning/http/client/Param;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    invoke-virtual {v2}, Lcom/ning/http/client/Param;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 244
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "param":Lcom/ning/http/client/Param;
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
