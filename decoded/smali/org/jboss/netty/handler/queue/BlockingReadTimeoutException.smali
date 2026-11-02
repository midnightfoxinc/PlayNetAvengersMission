.class public Lorg/jboss/netty/handler/queue/BlockingReadTimeoutException;
.super Ljava/io/InterruptedIOException;
.source "BlockingReadTimeoutException.java"


# static fields
.field private static final serialVersionUID:J = 0x4f0cc8170817715L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/queue/BlockingReadTimeoutException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 54
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/queue/BlockingReadTimeoutException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 55
    return-void
.end method
