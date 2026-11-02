.class public Lcom/disney/id/android/log/NewRelicResponse;
.super Ljava/lang/Object;
.source "NewRelicResponse.java"


# instance fields
.field public success:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "success"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/log/NewRelicResponse;->success:Z

    return-void
.end method
