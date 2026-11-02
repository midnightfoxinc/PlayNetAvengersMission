.class public Lcom/disney/id/android/DIDGuest$GuestException;
.super Ljava/lang/Exception;
.source "DIDGuest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDGuest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GuestException"
.end annotation


# static fields
.field private static final DEFAULT_MESSAGE:Ljava/lang/String; = "Invalid DIDGuest object"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDGuest;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/DIDGuest;)V
    .locals 1

    .prologue
    .line 366
    iput-object p1, p0, Lcom/disney/id/android/DIDGuest$GuestException;->this$0:Lcom/disney/id/android/DIDGuest;

    .line 367
    const-string v0, "Invalid DIDGuest object"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 368
    return-void
.end method
