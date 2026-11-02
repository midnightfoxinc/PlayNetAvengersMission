.class public abstract Lorg/jboss/netty/logging/AbstractInternalLogger;
.super Ljava/lang/Object;
.source "AbstractInternalLogger.java"

# interfaces
.implements Lorg/jboss/netty/logging/InternalLogger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/logging/AbstractInternalLogger$1;
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method


# virtual methods
.method public isEnabled(Lorg/jboss/netty/logging/InternalLogLevel;)Z
    .locals 2
    .param p1, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;

    .prologue
    .line 32
    sget-object v0, Lorg/jboss/netty/logging/AbstractInternalLogger$1;->$SwitchMap$org$jboss$netty$logging$InternalLogLevel:[I

    invoke-virtual {p1}, Lorg/jboss/netty/logging/InternalLogLevel;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 42
    new-instance v0, Ljava/lang/Error;

    invoke-direct {v0}, Ljava/lang/Error;-><init>()V

    throw v0

    .line 34
    :pswitch_0
    invoke-virtual {p0}, Lorg/jboss/netty/logging/AbstractInternalLogger;->isDebugEnabled()Z

    move-result v0

    .line 40
    :goto_0
    return v0

    .line 36
    :pswitch_1
    invoke-virtual {p0}, Lorg/jboss/netty/logging/AbstractInternalLogger;->isInfoEnabled()Z

    move-result v0

    goto :goto_0

    .line 38
    :pswitch_2
    invoke-virtual {p0}, Lorg/jboss/netty/logging/AbstractInternalLogger;->isWarnEnabled()Z

    move-result v0

    goto :goto_0

    .line 40
    :pswitch_3
    invoke-virtual {p0}, Lorg/jboss/netty/logging/AbstractInternalLogger;->isErrorEnabled()Z

    move-result v0

    goto :goto_0

    .line 32
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public log(Lorg/jboss/netty/logging/InternalLogLevel;Ljava/lang/String;)V
    .locals 2
    .param p1, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 66
    sget-object v0, Lorg/jboss/netty/logging/AbstractInternalLogger$1;->$SwitchMap$org$jboss$netty$logging$InternalLogLevel:[I

    invoke-virtual {p1}, Lorg/jboss/netty/logging/InternalLogLevel;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 80
    new-instance v0, Ljava/lang/Error;

    invoke-direct {v0}, Ljava/lang/Error;-><init>()V

    throw v0

    .line 68
    :pswitch_0
    invoke-virtual {p0, p2}, Lorg/jboss/netty/logging/AbstractInternalLogger;->debug(Ljava/lang/String;)V

    .line 82
    :goto_0
    return-void

    .line 71
    :pswitch_1
    invoke-virtual {p0, p2}, Lorg/jboss/netty/logging/AbstractInternalLogger;->info(Ljava/lang/String;)V

    goto :goto_0

    .line 74
    :pswitch_2
    invoke-virtual {p0, p2}, Lorg/jboss/netty/logging/AbstractInternalLogger;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 77
    :pswitch_3
    invoke-virtual {p0, p2}, Lorg/jboss/netty/logging/AbstractInternalLogger;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 66
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public log(Lorg/jboss/netty/logging/InternalLogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 47
    sget-object v0, Lorg/jboss/netty/logging/AbstractInternalLogger$1;->$SwitchMap$org$jboss$netty$logging$InternalLogLevel:[I

    invoke-virtual {p1}, Lorg/jboss/netty/logging/InternalLogLevel;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 61
    new-instance v0, Ljava/lang/Error;

    invoke-direct {v0}, Ljava/lang/Error;-><init>()V

    throw v0

    .line 49
    :pswitch_0
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/logging/AbstractInternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    :goto_0
    return-void

    .line 52
    :pswitch_1
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/logging/AbstractInternalLogger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 55
    :pswitch_2
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/logging/AbstractInternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 58
    :pswitch_3
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/logging/AbstractInternalLogger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 47
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
