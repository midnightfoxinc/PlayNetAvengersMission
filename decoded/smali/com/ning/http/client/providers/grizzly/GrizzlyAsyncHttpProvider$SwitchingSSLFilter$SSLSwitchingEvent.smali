.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/filterchain/FilterChainEvent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SSLSwitchingEvent"
.end annotation


# instance fields
.field final connection:Lorg/glassfish/grizzly/Connection;

.field final secure:Z


# direct methods
.method constructor <init>(ZLorg/glassfish/grizzly/Connection;)V
    .locals 0
    .param p1, "secure"    # Z
    .param p2, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 2235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2237
    iput-boolean p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;->secure:Z

    .line 2238
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;->connection:Lorg/glassfish/grizzly/Connection;

    .line 2240
    return-void
.end method


# virtual methods
.method public type()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 2247
    const-class v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter$SSLSwitchingEvent;

    return-object v0
.end method
