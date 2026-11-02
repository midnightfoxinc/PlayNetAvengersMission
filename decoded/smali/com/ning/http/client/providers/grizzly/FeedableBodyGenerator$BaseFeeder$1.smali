.class final Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$1;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lorg/glassfish/grizzly/WriteHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->blockUntilQueueFree(Lorg/glassfish/grizzly/Connection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$future:Lorg/glassfish/grizzly/impl/FutureImpl;


# direct methods
.method constructor <init>(Lorg/glassfish/grizzly/impl/FutureImpl;)V
    .locals 0

    .prologue
    .line 349
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$1;->val$future:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 358
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$1;->val$future:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-static {p1}, Lorg/glassfish/grizzly/utils/Exceptions;->makeIOException(Ljava/lang/Throwable;)Ljava/io/IOException;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/impl/FutureImpl;->failure(Ljava/lang/Throwable;)V

    .line 359
    return-void
.end method

.method public onWritePossible()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 353
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$1;->val$future:Lorg/glassfish/grizzly/impl/FutureImpl;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/impl/FutureImpl;->result(Ljava/lang/Object;)V

    .line 354
    return-void
.end method
