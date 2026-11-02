.class public Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;
.super Ljava/lang/Exception;
.source "DIDLocalData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/localdata/DIDLocalData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LocalDataException"
.end annotation


# static fields
.field private static final DEFAULT_MESSAGE:Ljava/lang/String; = "Invalid DIDLocalData object"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/localdata/DIDLocalData;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/localdata/DIDLocalData;)V
    .locals 1

    .prologue
    .line 100
    iput-object p1, p0, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;->this$0:Lcom/disney/id/android/localdata/DIDLocalData;

    .line 101
    const-string v0, "Invalid DIDLocalData object"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/localdata/DIDLocalData;Ljava/lang/String;)V
    .locals 0
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;->this$0:Lcom/disney/id/android/localdata/DIDLocalData;

    .line 105
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 106
    return-void
.end method
