.class Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;
.super Ljava/lang/Object;
.source "HostnameVerifierListener.java"

# interfaces
.implements Lorg/glassfish/grizzly/ssl/SSLBaseFilter$HandshakeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final VERIFIER_TASK_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/attributes/Attribute",
            "<",
            "Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 37
    const-class v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->LOGGER:Lorg/slf4j/Logger;

    .line 39
    sget-object v0, Lorg/glassfish/grizzly/Grizzly;->DEFAULT_ATTRIBUTE_BUILDER:Lorg/glassfish/grizzly/attributes/AttributeBuilder;

    const-class v1, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/attributes/AttributeBuilder;->createAttribute(Ljava/lang/String;)Lorg/glassfish/grizzly/attributes/Attribute;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->VERIFIER_TASK_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method static synthetic access$000(Lorg/glassfish/grizzly/Connection;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;Lorg/glassfish/grizzly/CompletionHandler;)V
    .locals 0
    .param p0, "x0"    # Lorg/glassfish/grizzly/Connection;
    .param p1, "x1"    # Ljavax/net/ssl/HostnameVerifier;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Lorg/glassfish/grizzly/CompletionHandler;

    .prologue
    .line 36
    invoke-static {p0, p1, p2, p3}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->assignHostnameVerifyTask(Lorg/glassfish/grizzly/Connection;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;Lorg/glassfish/grizzly/CompletionHandler;)V

    return-void
.end method

.method static synthetic access$100()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->LOGGER:Lorg/slf4j/Logger;

    return-object v0
.end method

.method private static assignHostnameVerifyTask(Lorg/glassfish/grizzly/Connection;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;Lorg/glassfish/grizzly/CompletionHandler;)V
    .locals 2
    .param p0, "connection"    # Lorg/glassfish/grizzly/Connection;
    .param p1, "verifier"    # Ljavax/net/ssl/HostnameVerifier;
    .param p2, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/glassfish/grizzly/Connection;",
            "Ljavax/net/ssl/HostnameVerifier;",
            "Ljava/lang/String;",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p3, "delegate":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    new-instance v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;

    invoke-direct {v0, p1, p0, p2, p3}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;-><init>(Ljavax/net/ssl/HostnameVerifier;Lorg/glassfish/grizzly/Connection;Ljava/lang/String;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 100
    .local v0, "task":Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;
    sget-object v1, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->VERIFIER_TASK_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v1, p0, v0}, Lorg/glassfish/grizzly/attributes/Attribute;->set(Lorg/glassfish/grizzly/attributes/AttributeStorage;Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method static wrapWithHostnameVerifierHandler(Lorg/glassfish/grizzly/CompletionHandler;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;)Lorg/glassfish/grizzly/CompletionHandler;
    .locals 1
    .param p1, "verifier"    # Ljavax/net/ssl/HostnameVerifier;
    .param p2, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;",
            "Ljavax/net/ssl/HostnameVerifier;",
            "Ljava/lang/String;",
            ")",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "completionHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    new-instance v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$1;-><init>(Lorg/glassfish/grizzly/CompletionHandler;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public onComplete(Lorg/glassfish/grizzly/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 54
    sget-object v1, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->VERIFIER_TASK_ATTR:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v1, p1}, Lorg/glassfish/grizzly/attributes/Attribute;->remove(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;

    .line 55
    .local v0, "task":Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;
    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {v0}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->verify()V

    .line 58
    :cond_0
    return-void
.end method

.method public onStart(Lorg/glassfish/grizzly/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 49
    sget-object v0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "SSL Handshake onStart: "

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 50
    return-void
.end method
