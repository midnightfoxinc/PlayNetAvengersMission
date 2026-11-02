.class public interface abstract Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Feeder"
.end annotation


# virtual methods
.method public abstract feed(Lorg/glassfish/grizzly/Buffer;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract flush()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
